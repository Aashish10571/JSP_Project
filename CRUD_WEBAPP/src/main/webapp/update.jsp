<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.UserDao, com.example.entity.User" %>

<%
    UserDao userDao = new UserDao();
    String idParam = request.getParameter("id");
    User user = null;

    try {
            if (idParam != null && !idParam.isEmpty()) {
                long id = Long.parseLong(idParam);
                user = userDao.getUserById(id);

            if (user == null) {
                    out.println("Error: User not found.");
            } else if (request.getMethod().equalsIgnoreCase("POST")) {
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String emailPhoneNo = request.getParameter("emailPhoneNo");

                    if (name != null && !name.isEmpty() && address != null && !address.isEmpty() && emailPhoneNo != null &&
                    !emailPhoneNo.isEmpty()) {
                        user.setName(name);
                        user.setAddress(address);
                        user.setEmail(emailPhoneNo);

                        userDao.updateUser(user);
                        response.sendRedirect("view.jsp");
                    } else {
                        out.println("Error: Name, Address and Email cannot be empty.");
                    }
                }
            } else {
                out.println("Error: Invalid user ID.");
            }
    } catch (NumberFormatException e) {
            out.println("Error: User ID is not a valid number.");
    } catch (Exception e) {
            out.println("Error: Unable to process the request. " + e.getMessage());
    }
%>

<html>
<head>
    <title>Update Data</title>
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
    <div class="container flex">
      <div class="wrapper flex">
        <div class="box"></div>
      </div>
      <div class="add-form flex">
            <form action="update.jsp?id=<%= user.getId() %>" method="post" class="flex">
                <h2>Update User</h2>
                <input type="text" class="input-box" value="<%= user.getName() %>" name="name" />
                <input type="text" class="input-box" value="<%= user.getAddress() %>" name="address" />
                <input
                  type="text"
                  class="input-box"
                  value="<%= user.getEmail() %>"
                  name="emailPhoneNo"
                />
                <input type="submit" class="submit-btn" value="Update" />
                <p class="hr-line" >---------------- and ----------------</p>
                <p class="label" >press update to update the data.</p>
            </form>
       </div>
    </div>
</body>
</html>
