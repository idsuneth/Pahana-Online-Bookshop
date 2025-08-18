<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    String itemName = request.getParameter("itemName");
    String priceStr = request.getParameter("price");
    String quantityStr = request.getParameter("quantity");
    String category = request.getParameter("category");

    if (idStr == null || idStr.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid item ID.</p>");
        return;
    }

    int id = Integer.parseInt(idStr);
    double price = 0;
    int quantity = 0;

    try {
        price = Double.parseDouble(priceStr);
        quantity = Integer.parseInt(quantityStr);
    } catch (NumberFormatException e) {
        out.println("<p style='color:red;'>Invalid number format for price or quantity.</p>");
        return;
    }

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(
             "UPDATE item SET item_name=?, price=?, quantity=?, category=? WHERE id=?")) {

        ps.setString(1, itemName);
        ps.setDouble(2, price);
        ps.setInt(3, quantity);
        ps.setString(4, category);
        ps.setInt(5, id);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            response.sendRedirect("ViewItems.jsp");
        } else {
            out.println("<p style='color:red;'>Update failed. Item not found.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error updating item: " + e.getMessage() + "</p>");
    }
%>
