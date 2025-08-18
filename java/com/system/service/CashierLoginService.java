package com.system.service;

import com.system.dao.CashierLoginDAO;
import com.system.model.CashierLogin;

public class CashierLoginService {
    private CashierLoginDAO dao = new CashierLoginDAO();

    public boolean validateCashier(CashierLogin cashier) {
        return dao.checkLogin(cashier);
    }
}
