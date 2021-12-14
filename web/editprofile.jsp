<%-- 
    Document   : editprofile
    Created on : 14-Dec-2021, 2:23:53 pm
    Author     : Aarya
--%>

<%@page import="java.util.List"%>
<%@page import="com.crud.project.UserDao"%>
<%@page import="com.crud.project.ConnectionDao"%>
<%@page import="com.crud.project.ConnectionDao"%>
<%@page import="com.crud.project.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("loguser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank</title>
    <link rel="stylesheet" type="text/css" href="css\editprofile.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="addD.jsp">Donate/Request</a></li>
        
        <li style="float:right"><a href="logout">Logout</a></li>
        <li style="float:right"><a class="active" href="editprofile.jsp">Hello, <%if(user!=null){out.println(user.getFname());}%></a></li>
    </ul>
    <div class="body">
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="signup">
                <c:if test="${not empty message}">
                        <div class="success">${message}</div>
                    <c:remove var="message"/>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                    <c:remove var="error"/>
                </c:if>
                <form action="editp" method="POST">
                    <h1>Blood Bank</h1>
                    <label for="chk" aria-hidden="true">Edit Profile</label>
                    <input type="hidden" name="u_id" placeholder="User Id" value="<%if(user!=null){out.println(user.getU_id());}%>"required="">
                    <input type="text" name="fname" placeholder="First name" value="<%if(user!=null){out.println(user.getFname());}%>"required="">
                    <input type="text" name="lname" placeholder="Last name" value="<%if(user!=null){out.println(user.getLname());}%>"required="">
                    <input type="text" disabled name="dob" placeholder= "DOB" value="<%if(user!=null){out.println(user.getDob());}%>" required="">
                    <input type="text" disabled name="email" placeholder="Email" value="<%if(user!=null){out.println(user.getEmail());}%>" required="">
                    <input type="password" name="pass" placeholder="Password" value="<%if(user!=null){out.println(user.getPassword());}%>" required="">
                    <input type="hidden" disabled name="acc" placeholder="Status" value="<%if(user!=null){out.print(user.getAcc());}%>"required="">
                    <button>Confirm</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>