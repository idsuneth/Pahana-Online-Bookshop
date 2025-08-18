package com.system.service;

import com.system.dao.CashierDAO;
import com.system.model.Cashier;

import java.sql.SQLException;

public class CashierService {
    private CashierDAO cashierDAO = new CashierDAO();

    public boolean addCashier(Cashier cashier) throws SQLException {
        // add any extra validation or business logic if needed
        return cashierDAO.addCashier(cashier);
    }
}

