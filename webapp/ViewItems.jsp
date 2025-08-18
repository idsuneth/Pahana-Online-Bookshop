<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    java.util.List<java.util.Map<String, String>> items = new java.util.ArrayList<>();

    try {
        conn = DBUtil.getConnection();
        String sql = "SELECT * FROM item ORDER BY id";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            java.util.Map<String, String> item = new java.util.HashMap<>();
            item.put("id", String.valueOf(rs.getInt("id")));
            item.put("itemName", rs.getString("item_name"));
            item.put("price", String.format("%.2f", rs.getDouble("price")));
            item.put("quantity", String.valueOf(rs.getInt("quantity")));
            item.put("category", rs.getString("category"));
            items.add(item);
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading items: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (ps != null) try { ps.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Items - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #e0f7fa; padding: 40px; color: #004d40; }
    h2 { text-align: center; margin-bottom: 20px; color: #00796b; }
    table { border-collapse: collapse; width: 90%; margin: auto; background: white; border-radius: 10px; box-shadow: 0 0 15px rgba(0,77,64,0.2); }
    th, td { padding: 10px; border-bottom: 1px solid #ccc; text-align: center; }
    th { background-color: #00796b; color: white; }
    tr:hover { background-color: #c8e6c9; }
    .btn { padding: 5px 12px; border: none; border-radius: 20px; cursor: pointer; font-weight: 600; text-decoration: none; color: white; }
    .update-btn { background-color: #0288d1; }
    .update-btn:hover { background-color: #01579b; }
    .delete-btn { background-color: #d32f2f; }
    .delete-btn:hover { background-color: #9a0007; }
    .back-button { display: block; margin: 20px auto; padding: 10px 25px; background: #00796b; color: white; border-radius: 25px; text-align: center; width: 200px; }
    .back-button:hover { background: #004d40; }
</style>
</head>
<body>

<h2>Item List</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Item Name</th>
            <th>Price (LKR)</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            if (items.isEmpty()) {
        %>
            <tr>
                <td colspan="6">No items found.</td>
            </tr>
        <%
            } else {
                for (java.util.Map<String, String> i : items) {
        %>
            <tr>
                <td><%= i.get("id") %></td>
                <td><%= i.get("itemName") %></td>
                <td><%= i.get("price") %></td>
                <td><%= i.get("quantity") %></td>
                <td><%= i.get("category") %></td>
                <td>
                    <a href="UpdateItem.jsp?id=<%= i.get("id") %>" class="btn update-btn">Update</a>
                    <form action="DeleteItem.jsp" method="post" style="display:inline;" 
                          onsubmit="return confirm('Are you sure you want to delete this item?');">
                        <input type="hidden" name="id" value="<%= i.get("id") %>">
                        <button type="submit" class="btn delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        <%
                }
            }
        %>
    </tbody>
</table>

<a href="adminDashboard.jsp" class="back-button">← Back to Dashboard</a>

</body>
</html>
