<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.UserDao, com.example.entity.User" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String emailPhoneNo = request.getParameter("emailPhoneNo");

        if (name != null && !name.isEmpty() && address != null && !address.isEmpty() && emailPhoneNo != null &&
        !emailPhoneNo.isEmpty()) {
            User user = new User();
            user.setName(name);
            user.setAddress(address);
            user.setEmail(emailPhoneNo);

            UserDao userDao = new UserDao();
            try {
                userDao.saveUser(user);
                response.sendRedirect("view.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
%>

<html>
<head>
    <title>Add User</title>
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
            <form action="add.jsp" method="post" class="flex">
                <h2>Add User</h2>
                <input type="text" class="input-box" placeholder="Name" name="name" />
                <input type="text" class="input-box" placeholder="Address" name="address" />
                <input
                  type="text"
                  class="input-box"
                  placeholder="Email or Phone number"
                  name="emailPhoneNo"
                />
                <input type="submit" class="submit-btn" value="Save" />
                <p class="hr-line" >---------------- and ----------------</p>
                <p class="label" >press save to save the data.</p>
            </form>
       </div>
    </div>
</body>
</html>
