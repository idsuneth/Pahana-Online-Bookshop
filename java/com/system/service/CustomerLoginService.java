package com.system.service;

import com.system.dao.CustomerLoginDAO;
import com.system.model.CustomerLoginModel;

public class CustomerLoginService {

    private CustomerLoginDAO dao = new CustomerLoginDAO();

    public boolean authenticate(CustomerLoginModel customer) {
        return dao.validate(customer);
    }
}


