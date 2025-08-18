<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String nic = request.getParameter("nic");
    String phoneNumber = request.getParameter("phoneNumber");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (idStr == null || idStr.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid cashier ID.</p>");
        return;
    }

    int id = Integer.parseInt(idStr);

    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(
             "UPDATE cashier SET name=?, address=?, nic=?, phone_number=?, username=?, password=? WHERE id=?")) {

        ps.setString(1, name);
        ps.setString(2, address);
        ps.setString(3, nic);
        ps.setString(4, phoneNumber);
        ps.setString(5, username);
        ps.setString(6, password);
        ps.setInt(7, id);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            // Redirect to view cashiers page after successful update
            response.sendRedirect("ViewCashiers.jsp");
        } else {
            out.println("<p style='color:red;'>Update failed. Cashier not found.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error updating cashier: " + e.getMessage() + "</p>");
    }
%>
