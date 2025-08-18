<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid item ID.</p>");
        return;
    }

    int id = Integer.parseInt(idStr);
    String itemName = "", category = "";
    double price = 0.0;
    int quantity = 0;

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM item WHERE id = ?")) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                itemName = rs.getString("item_name");
                price = rs.getDouble("price");
                quantity = rs.getInt("quantity");
                category = rs.getString("category");
            } else {
                out.println("<p style='color:red;'>Item not found.</p>");
                return;
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading item: " + e.getMessage() + "</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Update Item - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #e0f7fa; padding: 40px; color: #004d40; }
    h2 { text-align: center; margin-bottom: 20px; color: #00796b; }
    form { max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,77,64,0.2); }
    label { display: block; margin-top: 10px; font-weight: bold; }
    input[type="text"], input[type="number"] { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    .btn { margin-top: 20px; padding: 10px 20px; border: none; border-radius: 20px; cursor: pointer; font-weight: bold; color: white; }
    .save-btn { background-color: #0288d1; }
    .save-btn:hover { background-color: #01579b; }
    .cancel-btn { background-color: #d32f2f; text-decoration: none; display: inline-block; text-align: center; }
    .cancel-btn:hover { background-color: #9a0007; }
</style>
</head>
<body>

<h2>Update Item</h2>

<form action="UpdateItemAction.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label>Item Name:</label>
    <input type="text" name="itemName" value="<%= itemName %>" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="<%= price %>" required>

    <label>Quantity:</label>
    <input type="number" name="quantity" value="<%= quantity %>" required>

    <label>Category:</label>
    <input type="text" name="category" value="<%= category %>" required>

    <button type="submit" class="btn save-btn">Save Changes</button>
    <a href="ViewItems.jsp" class="btn cancel-btn">Cancel</a>
</form>

</body>
</html>
