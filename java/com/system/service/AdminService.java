package com.system.service;

import com.system.dao.AdminDAO;
import com.system.model.Admin;

public class AdminService {
    private AdminDAO adminDAO = new AdminDAO();

    public boolean login(String username, String password) {
        Admin admin = new Admin(username, password);
        return adminDAO.validate(admin);
    }
}