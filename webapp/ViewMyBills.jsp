<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.system.util.DBUtil" %>
<%
    String accountNumber = (String) session.getAttribute("accountNumber");
    if (accountNumber == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

    Map<Integer, List<Map<String, Object>>> billItemsMap = new HashMap<>();
    List<Map<String, Object>> bills = new ArrayList<>();

    try (Connection conn = DBUtil.getConnection()) {
        String billSql = "SELECT bill_id, total_amount FROM bill WHERE account_number = ?";
        try (PreparedStatement psBills = conn.prepareStatement(billSql)) {
            psBills.setString(1, accountNumber);
            try (ResultSet rsBills = psBills.executeQuery()) {
                while (rsBills.next()) {
                    int billId = rsBills.getInt("bill_id");
                    double totalAmount = rsBills.getDouble("total_amount");

                    Map<String, Object> bill = new HashMap<>();
                    bill.put("billId", billId);
                    bill.put("totalAmount", totalAmount);
                    bills.add(bill);

                    String itemSql = "SELECT item_name, quantity, price_per_unit FROM bill_item WHERE bill_id = ?";
                    try (PreparedStatement psItems = conn.prepareStatement(itemSql)) {
                        psItems.setInt(1, billId);
                        try (ResultSet rsItems = psItems.executeQuery()) {
                            List<Map<String, Object>> itemsList = new ArrayList<>();
                            while (rsItems.next()) {
                                Map<String, Object> item = new HashMap<>();
                                item.put("itemName", rsItems.getString("item_name"));
                                item.put("quantity", rsItems.getInt("quantity"));
                                item.put("pricePerUnit", rsItems.getDouble("price_per_unit"));
                                itemsList.add(item);
                            }
                            billItemsMap.put(billId, itemsList);
                        }
                    }
                }
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading bills: " + e.getMessage() + "</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>My Bills - Pahana Edu</title>
<style>
    /* Reset */
    *, *::before, *::after {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
        padding: 40px 20px;
        color: #333;
        margin: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    .container {
        background: #fff;
        max-width: 900px;
        width: 100%;
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        color: #1b5e20;
        font-weight: 700;
        margin-bottom: 40px;
        font-size: 2.5rem;
        letter-spacing: 1px;
    }

    .bill {
        border-radius: 12px;
        background: #e8f5e9;
        padding: 25px 30px;
        margin-bottom: 35px;
        box-shadow: 0 6px 15px rgba(27, 94, 32, 0.15);
        transition: transform 0.3s ease;
    }

    .bill:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 25px rgba(27, 94, 32, 0.25);
    }

    .bill h3 {
        margin-top: 0;
        color: #2e7d32;
        font-weight: 700;
        font-size: 1.75rem;
        margin-bottom: 20px;
        border-bottom: 2px solid #81c784;
        padding-bottom: 8px;
    }

    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
        margin-top: 15px;
        font-size: 1rem;
        color: #2e7d32;
    }

    thead th {
        background-color: #4caf50;
        color: white;
        padding: 12px 15px;
        font-weight: 600;
        border-radius: 12px 12px 0 0;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    tbody tr {
        background: #c8e6c9;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transition: background-color 0.25s ease;
    }

    tbody tr:hover {
        background-color: #a5d6a7;
    }

    tbody td {
        padding: 12px 15px;
        text-align: center;
        vertical-align: middle;
    }

    .total {
        margin-top: 15px;
        font-weight: 700;
        font-size: 1.2rem;
        text-align: right;
        color: #1b5e20;
    }

    a.back-link {
        display: inline-block;
        margin-top: 30px;
        text-align: center;
        color: #2e7d32;
        text-decoration: none;
        font-weight: 600;
        padding: 12px 25px;
        border: 2px solid #2e7d32;
        border-radius: 30px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    a.back-link:hover {
        background-color: #2e7d32;
        color: #fff;
        text-decoration: none;
    }

    @media (max-width: 600px) {
        .container {
            padding: 20px 15px;
        }
        h2 {
            font-size: 2rem;
        }
        .bill h3 {
            font-size: 1.4rem;
        }
        table {
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h2>Your Bills</h2>

    <%
        if (bills.isEmpty()) {
    %>
        <p style="text-align:center; font-size: 1.2rem; color:#4caf50;">You have no bills.</p>
    <%
        } else {
            for (Map<String, Object> bill : bills) {
                int billId = (int) bill.get("billId");
                double totalAmount = (double) bill.get("totalAmount");
                List<Map<String, Object>> items = billItemsMap.get(billId);
    %>
        <div class="bill">
            <h3>Bill ID: <%= billId %></h3>

            <table>
                <thead>
                    <tr>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price per Unit (Rs)</th>
                        <th>Total (Rs)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (items != null) {
                            for (Map<String, Object> item : items) {
                                String itemName = (String) item.get("itemName");
                                int qty = (int) item.get("quantity");
                                double price = (double) item.get("pricePerUnit");
                                double lineTotal = qty * price;
                    %>
                    <tr>
                        <td><%= itemName %></td>
                        <td><%= qty %></td>
                        <td><%= String.format("%.2f", price) %></td>
                        <td><%= String.format("%.2f", lineTotal) %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <div class="total">Total Amount: Rs <%= String.format("%.2f", totalAmount) %></div>
        </div>
    <%
            }
        }
    %>

    <a class="back-link" href="CustomerDashboard.jsp">← Back to Dashboard</a>
</div>

</body>
</html>
