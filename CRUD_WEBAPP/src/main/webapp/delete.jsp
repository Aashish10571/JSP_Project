<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.UserDao"%>

<%
    UserDao userDao = new UserDao();
    String idParam = request.getParameter("id");

    try {
        if (idParam != null && !idParam.isEmpty()) {
            long id = Long.parseLong(idParam);
            userDao.deleteUser(id);
            response.sendRedirect("view.jsp");
        } else {
            out.println("Invalid user ID.");
        }
    } catch (NumberFormatException e) {
        out.println("Error: User ID is not a valid number.");
    } catch (Exception e) {
        out.println("Error: Unable to delete user. " + e.getMessage());
    }
%>