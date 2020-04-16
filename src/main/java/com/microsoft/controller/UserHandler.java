package com.microsoft.controller;

import com.microsoft.entity.User;
import com.microsoft.service.UserService;
import com.microsoft.util.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserHandler {

    @Autowired
    private UserService userService;

    /*
    查出整张用户表
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("users");
        modelAndView.addObject("list",userService.findAll());
        return modelAndView;
    }

    /*
    删除用户
     */
    @GetMapping("/delete")
    public ModelAndView deleteUser(String id){
        ModelAndView modelAndView = new ModelAndView();
        userService.deleteById(Long.parseLong(id));
        View view = new InternalResourceView("/user/findAll");
        modelAndView.setView(view);
        return modelAndView;
    }

    /*
    更改信息
     */
    @PostMapping("/update")
    public ModelAndView updateUser(User foundUser){
        ModelAndView modelAndView = new ModelAndView();
        userService.update(foundUser);
        View view = new InternalResourceView("/user/findAll");
        modelAndView.setView(view);
        return modelAndView;
    }

    /*
    查找单个用户
     */
    @GetMapping("/findByName")
    public ModelAndView findByName(String username){
        ModelAndView modelAndView = new ModelAndView();
        User foundUser = userService.findByUsername(username);
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("foundUser",foundUser);
        return modelAndView;
    }

    /*
    请求登录
     */
    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("user",new User());
        return  "login";
    }

    @PostMapping("/login")
    public ModelAndView login(@Validated User user, BindingResult bindingResult,HttpServletRequest request,String checkcode){
        ModelAndView modelAndView = new ModelAndView();
        if(bindingResult.hasErrors()){
            modelAndView.setViewName("login");
        }else{
            User foundUser = userService.findByUsername(user.getUsername());
            HttpSession session = request.getSession();
            // 获取验证码的正确答案
            String sourceCode = (String) session.getAttribute(RandomValidateCode.RANDOMCODEKEY);
            // 去除大小写敏感问题
            sourceCode.toUpperCase();
            String backCode = checkcode.toUpperCase();
            if(foundUser!=null && foundUser.getPassword().equals(user.getPassword()) && sourceCode.equals(backCode)){
                modelAndView.addObject("user",foundUser);
                modelAndView.setViewName("welcome");
            }else{
                View view = new InternalResourceView("/login.jsp");
                modelAndView.setView(view);
            }
        }
        return modelAndView;
    }

    /**
     * 前端请求注册
     * @param model
     * @return "register"
     */
    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("user",new User());
        return  "register";
    }

    /**
     * 前端传注册用户的表单过来，这边对该用户做相应的处理
     * @param user
     * @param bindingResult
     * @param checkedPassword
     * @return
     */
    @PostMapping("/register")
    public ModelAndView register(@Validated User user, BindingResult bindingResult,String checkedPassword){
        ModelAndView modelAndView = new ModelAndView();
        // 首先，用户名、密码不能为空
        if(bindingResult.hasErrors()){
            modelAndView.setViewName("register");
        }else{
            List<User> users = userService.findAll();
            boolean isUserExisted = false;
            for(User u : users){
                if(u.getUsername().equals(user.getUsername())){
                    isUserExisted = true;
                }
            }
            // 其次，要保证注册的用户名不存在，并且确认密码与密码相同
            if(isUserExisted || !user.getPassword().equals(checkedPassword)){
                View view = new InternalResourceView("/register.jsp");
                modelAndView.setView(view);
            }else{
                User newUser = new User();
                newUser.setUsername(user.getUsername());
                newUser.setPassword(user.getPassword());
                newUser.setAge(user.getAge());
                userService.create(newUser);
                modelAndView.addObject("user",newUser);
                modelAndView.setViewName("registerSuccess");
            }
        }
        return modelAndView;
    }

    /**
     * 获取生成验证码显示到 UI 界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
