package com.microsoft.service.impl;

import com.microsoft.entity.User;
import com.microsoft.repository.UserRepository;
import com.microsoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public int create(User user) {
        return userRepository.create(user);
    }

    @Override
    public int deleteById(long id) {
        return userRepository.deleteById(id);
    }

    @Override
    public int update(User user) {
        return userRepository.update(user);
    }

    @Override
    public void loginCheck(User form, User foundUser, String needToBeChecked, String answer, ModelAndView modelAndView) {
        // 去除大小写敏感问题
        answer.toUpperCase();
        String backCode = needToBeChecked.toUpperCase();
        if(foundUser!=null && foundUser.getPassword().equals(form.getPassword()) && answer.equals(backCode)){
            modelAndView.addObject("user",foundUser);
            modelAndView.setViewName("welcome");
        }else{
            View view = new InternalResourceView("/login.jsp");
            modelAndView.setView(view);
        }
    }
}
