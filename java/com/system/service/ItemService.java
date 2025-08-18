package com.system.service;

import com.system.dao.ItemDAO;
import com.system.model.Item;

import java.sql.SQLException;

public class ItemService {
    private ItemDAO itemDAO = new ItemDAO();

    public boolean addItem(Item item) throws SQLException {
        // Add validation/business logic here if needed
        return itemDAO.addItem(item);
    }
}
