<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>

<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.trim().isEmpty()) {
        out.println("<p style='color:red;'>Invalid request. No item ID provided.</p>");
    } else {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            int id = Integer.parseInt(idStr);
            conn = DBUtil.getConnection();
            String sql = "DELETE FROM item WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("ViewItems.jsp"); // Redirect back to the items list
                return;
            } else {
                out.println("<p style='color:red;'>No item found with ID: " + id + "</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid item ID format.</p>");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error deleting item: " + e.getMessage() + "</p>");
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception ignored) {}
            if (conn != null) try { conn.close(); } catch (Exception ignored) {}
        }
    }
%>
