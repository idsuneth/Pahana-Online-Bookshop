<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid cashier ID.</p>");
        return;
    }

    int id = Integer.parseInt(idStr);
    String name = "", address = "", nic = "", phoneNumber = "", username = "", password = "";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM cashier WHERE id=?")) {
         
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                name = rs.getString("name");
                address = rs.getString("address");
                nic = rs.getString("nic");
                phoneNumber = rs.getString("phone_number");
                username = rs.getString("username");
                password = rs.getString("password");
            } else {
                out.println("<p style='color:red;'>Cashier not found.</p>");
                return;
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading cashier: " + e.getMessage() + "</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Cashier - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #e0f7fa; padding: 40px; color: #004d40; }
    h2 { text-align: center; margin-bottom: 20px; color: #00796b; }
    form { max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,77,64,0.2); }
    label { display: block; margin-top: 10px; font-weight: bold; }
    input[type="text"], input[type="password"] { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    .btn { margin-top: 20px; padding: 10px 20px; border: none; border-radius: 20px; cursor: pointer; font-weight: bold; color: white; }
    .save-btn { background-color: #0288d1; }
    .save-btn:hover { background-color: #01579b; }
    .cancel-btn { background-color: #d32f2f; text-decoration: none; display: inline-block; text-align: center; padding: 10px 20px; margin-left: 10px; border-radius: 20px; color: white; }
    .cancel-btn:hover { background-color: #9a0007; }
</style>
</head>
<body>

<h2>Update Cashier</h2>

<form action="UpdateCashierAction.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label for="name">Full Name:</label>
    <input type="text" id="name" name="name" value="<%= name %>" required>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="<%= address %>" required>

    <label for="nic">NIC:</label>
    <input type="text" id="nic" name="nic" value="<%= nic %>" required>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= phoneNumber %>" required>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="<%= username %>" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="<%= password %>" required>

    <button type="submit" class="btn save-btn">Save Changes</button>
    <a href="ViewCashiers.jsp" class="cancel-btn">Cancel</a>
</form>

</body>
</html>
