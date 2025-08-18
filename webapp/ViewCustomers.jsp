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
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #a8edea, #fed6e3);
        padding: 40px 20px;
        color: #2c3e50;
        min-height: 100vh;
        user-select: none;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #00796b;
        font-weight: 700;
        font-size: 2.4rem;
        letter-spacing: 1px;
    }

    table {
        border-collapse: separate;
        border-spacing: 0;
        width: 90%;
        margin: 0 auto 40px;
        background: #ffffffcc;
        border-radius: 16px;
        box-shadow:
            0 8px 16px rgba(0, 121, 107, 0.15),
            inset 0 0 8px rgba(255, 255, 255, 0.7);
        overflow: hidden;
        font-size: 1rem;
    }

    thead tr {
        background: #00796b;
        color: #ffffff;
        text-transform: uppercase;
        letter-spacing: 0.08em;
    }

    th, td {
        padding: 14px 18px;
        text-align: center;
    }

    tbody tr {
        transition: background-color 0.3s ease;
        cursor: default;
    }

    tbody tr:nth-child(even) {
        background-color: #e0f2f1;
    }

    tbody tr:hover {
        background-color: #b2dfdb;
    }

    .btn {
        padding: 8px 18px;
        border: none;
        border-radius: 24px;
        cursor: pointer;
        font-weight: 700;
        text-decoration: none;
        display: inline-block;
        font-size: 0.9rem;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .update-btn {
        background-color: #0288d1;
        color: #fff;
        margin-right: 8px;
    }

    .update-btn:hover,
    .update-btn:focus {
        background-color: #01579b;
        transform: translateY(-2px);
        outline: none;
    }

    .delete-btn {
        background-color: #d32f2f;
        color: #fff;
    }

    .delete-btn:hover,
    .delete-btn:focus {
        background-color: #9a0007;
        transform: translateY(-2px);
        outline: none;
    }

    .back-button {
        display: block;
        width: 220px;
        margin: 0 auto;
        padding: 12px 0;
        background: #00796b;
        color: white;
        font-weight: 700;
        border-radius: 30px;
        text-align: center;
        text-decoration: none;
        box-shadow: 0 6px 15px rgba(0, 121, 107, 0.4);
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        user-select: none;
    }

    .back-button:hover,
    .back-button:focus {
        background: #004d40;
        box-shadow: 0 8px 20px rgba(0, 77, 64, 0.7);
        outline: none;
    }
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
                    <a href="UpdateCustomer.jsp?accountNumber=<%= c.get("accountNumber") %>" class="btn update-btn">Update</a>

                    <form action="DeleteCustomer.jsp" method="post" style="display:inline;" 
                          onsubmit="return confirm('Are you sure you want to delete this customer?');">
                        <input type="hidden" name="accountNumber" value="<%= c.get("accountNumber") %>">
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
