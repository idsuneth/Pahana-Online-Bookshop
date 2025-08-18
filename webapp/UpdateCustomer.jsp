<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    String accountNumber = request.getParameter("accountNumber");
    if (accountNumber == null || accountNumber.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid account number.</p>");
        return;
    }

    String username = "", password = "", name = "", nic = "", address = "", phoneNumber = "";

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer WHERE account_number=?")) {

        ps.setString(1, accountNumber);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                username = rs.getString("username");
                password = rs.getString("password");
                name = rs.getString("name");
                nic = rs.getString("nic");
                address = rs.getString("address");
                phoneNumber = rs.getString("phone_number");
            } else {
                out.println("<p style='color:red;'>Customer not found.</p>");
                return;
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading customer: " + e.getMessage() + "</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Customer - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #e0f7fa; padding: 40px; color: #004d40; }
    h2 { text-align: center; margin-bottom: 20px; color: #00796b; }
    form { max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,77,64,0.2); }
    label { display: block; margin-top: 10px; font-weight: bold; }
    input[type="text"], input[type="password"] { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px; }
    .btn { margin-top: 20px; padding: 10px 20px; border: none; border-radius: 20px; cursor: pointer; font-weight: bold; color: white; }
    .save-btn { background-color: #0288d1; }
    .save-btn:hover { background-color: #01579b; }
    .cancel-btn { background-color: #d32f2f; text-decoration: none; display: inline-block; text-align: center; }
    .cancel-btn:hover { background-color: #9a0007; }
</style>
</head>
<body>

<h2>Update Customer</h2>

<form action="UpdateCustomerAction.jsp" method="post">
    <input type="hidden" name="accountNumber" value="<%= accountNumber %>">

    <label>Username:</label>
    <input type="text" name="username" value="<%= username %>" required>

    <label>Password:</label>
    <input type="password" name="password" value="<%= password %>" required>

    <label>Full Name:</label>
    <input type="text" name="name" value="<%= name %>" required>

    <label>NIC:</label>
    <input type="text" name="nic" value="<%= nic %>" required>

    <label>Address:</label>
    <input type="text" name="address" value="<%= address %>" required>

    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" value="<%= phoneNumber %>" required>

    <button type="submit" class="btn save-btn">Save Changes</button>
    <a href="ViewCustomers.jsp" class="btn cancel-btn">Cancel</a>
</form>

</body>
</html>
