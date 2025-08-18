<%@ page language="java" %>
<%
    session.invalidate(); // End the user session
    response.sendRedirect("index.jsp"); // Redirect to homepage
%>
