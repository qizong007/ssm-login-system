package com.microsoft.service.impl;

import com.microsoft.entity.User;
import com.microsoft.repository.UserRepository;
import com.microsoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
