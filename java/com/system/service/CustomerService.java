package com.system.service;

import com.system.dao.CustomerDAO;
import com.system.model.CustomerModel;

import java.sql.SQLException;

public class CustomerService {
    private CustomerDAO customerDAO = new CustomerDAO();

    public boolean addCustomer(CustomerModel customer) throws SQLException {
        // You can add extra validation or business logic here if needed
        return customerDAO.addCustomer(customer);
    }
}
