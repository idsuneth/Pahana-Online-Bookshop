<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    java.util.List<java.util.Map<String, String>> customers = new java.util.ArrayList<>();

    try {
        conn = DBUtil.getConnection();
        String sql = "SELECT * FROM customer ORDER BY account_number";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            java.util.Map<String, String> customer = new java.util.HashMap<>();
            customer.put("accountNumber", rs.getString("account_number"));
            customer.put("username", rs.getString("username"));
            customer.put("name", rs.getString("name"));
            customer.put("nic", rs.getString("nic"));
            customer.put("address", rs.getString("address"));
            customer.put("phoneNumber", rs.getString("phone_number"));
            customers.add(customer);
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading customers: " + e.getMessage() + "</p>");
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
<title>View Customers - Pahana Edu</title>
<style>
    body { font-family: Arial, sans-serif; background: #f1f8e9; padding: 40px; color: #33691e; }
    h2 { text-align: center; margin-bottom: 20px; color: #558b2f; }
    table { border-collapse: collapse; width: 90%; margin: auto; background: white; border-radius: 10px; box-shadow: 0 0 15px rgba(85,139,47,0.2); }
    th, td { padding: 10px; border-bottom: 1px solid #ccc; text-align: center; }
    th { background-color: #558b2f; color: white; }
    tr:hover { background-color: #dcedc8; }
    .btn { padding: 5px 12px; border: none; border-radius: 20px; cursor: pointer; font-weight: 600; text-decoration: none; color: white; }
    .update-btn { background-color: #0288d1; }
    .update-btn:hover { background-color: #01579b; }
    .delete-btn { background-color: #d32f2f; }
    .delete-btn:hover { background-color: #9a0007; }
    .back-button { display: block; margin: 20px auto; padding: 10px 25px; background: #558b2f; color: white; border-radius: 25px; text-align: center; width: 200px; }
    .back-button:hover { background: #33691e; }
</style>
</head>
<body>

<h2>Customer List</h2>

<table>
    <thead>
        <tr>
            <th>Account Number</th>
            <th>Username</th>
            <th>Full Name</th>
            <th>NIC</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            if (customers.isEmpty()) {
        %>
            <tr>
                <td colspan="7">No customers found.</td>
            </tr>
        <%
            } else {
                for (java.util.Map<String, String> c : customers) {
        %>
            <tr>
                <td><%= c.get("accountNumber") %></td>
                <td><%= c.get("username") %></td>
                <td><%= c.get("name") %></td>
                <td><%= c.get("nic") %></td>
                <td><%= c.get("address") %></td>
                <td><%= c.get("phoneNumber") %></td>
                <td>
                    <a href="UpdateCustomer.jsp?account_number=<%= c.get("accountNumber") %>" class="btn update-btn">Update</a>

                    <form action="DeleteCustomer.jsp" method="post" style="display:inline;" 
                          onsubmit="return confirm('Are you sure you want to delete this customer?');">
                        <input type="hidden" name="account_number" value="<%= c.get("accountNumber") %>">
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

<a href="cashierDashboard.jsp" class="back-button">← Back to Dashboard</a>

</body>
</html>
