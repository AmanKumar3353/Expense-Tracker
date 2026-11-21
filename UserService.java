package com.expensetracker.service;

import java.util.Optional;
import com.expensetracker.dao.UserDao;
import com.expensetracker.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserDao userDao;
    public UserService(UserDao userDao) { this.userDao = userDao; }

    public void register(String name, String email, String password) {
        if (name == null || name.isBlank() || email == null || email.isBlank()
                || password == null || password.length() < 6) {
            throw new IllegalArgumentException("Enter your name, email and a password of at least 6 characters.");
        }
        String cleanEmail = email.trim().toLowerCase();
        if (userDao.findByEmail(cleanEmail).isPresent()) {
            throw new IllegalArgumentException("An account with this email already exists.");
        }
        User user = new User();
        user.setName(name.trim());
        user.setEmail(cleanEmail);
        user.setPasswordHash(PasswordUtil.hash(password));
        userDao.save(user);
    }

    public Optional<User> login(String email, String password) {
        if (email == null || password == null) return Optional.empty();
        return userDao.findByEmail(email.trim().toLowerCase())
                .filter(user -> PasswordUtil.matches(password, user.getPasswordHash()));
    }
}
