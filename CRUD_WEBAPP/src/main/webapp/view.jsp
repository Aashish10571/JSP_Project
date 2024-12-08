<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.dao.UserDao, com.example.entity.User" %>

<%
    UserDao userDao = new UserDao();
    List<User> users = null;

    try {
        users = userDao.getAllUser();
    } catch (Exception e) {
        out.println("Error: Unable to fetch users. " + e.getMessage());
    }
%>

<html>
<head>
    <title>View Data</title>
    <link rel="stylesheet" href="styleSheet/style.css"/>
</head>

<body>
    <div class="nav-bar flex">
      <div class="logo">
        <p>CRUD</p>
      </div>
      <div class="action flex">
        <a href="index.jsp" class="links">Home</a>
        <a href="help.jsp" class="links">Help</a>
      </div>
    </div>
    <div class="view-contents flex">
        <div class="content flex">
                <% if (users == null || users.isEmpty()) { %>
                        <p>No data found!, Try adding data first.</p>
                <% } else { %>
                        <h2>List of all the data stored till now</h2>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>

                            <% for (User user : users) { %>
                            <tr>
                                <td><%= user.getId() %></td>
                                <td><%= user.getName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td class="flex">
                                    <a href="update.jsp?id=<%= user.getId() %>" >Update</a>
                                    <a href="delete.jsp?id=<%= user.getId() %>">Delete</a>
                                </td>
                            </tr>
                            <% } %>
                        </table>
                <% } %>
        </div>
    </div>
</body>
</html>
