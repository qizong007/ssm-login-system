package com.microsoft.service;

import com.microsoft.entity.User;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public User findByUsername(String username);
    public int create(User user);
    public int deleteById(long id);
    public int update(User user);
    public void loginCheck(User form, User foundUser, String needToBeChecked, String answer, ModelAndView modelAndView);
}
