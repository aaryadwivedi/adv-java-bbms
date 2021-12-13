<%-- 
    Document   : index
    Created on : 12-Dec-2021, 7:27:43 pm
    Author     : Aarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank</title>
    <link rel="stylesheet" type="text/css" href="css\login.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
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
               	<form action="AddUser" method="POST">
                        <h1>Blood Bank</h1>
                	<label for="chk" aria-hidden="true">Sign up</label>
                        <input type="text" name="fname" placeholder="First name" required="">
                        <input type="text" name="lname" placeholder="Last name" required="">
                        <input type="date" name="dob" placeholder= "DOB" required="">
			<input type="email" name="regemail" placeholder="Email" required="">
			<input type="password" name="regpswd" placeholder="Password" required="">
			<button>Sign up</button>
		</form>
	</div>
	<div class="login">
        	<form action="lgIn" method="POST">
                	<label for="chk" aria-hidden="true">Login</label>
			<input type="email" name="lgemail" placeholder="Email" required="">
			<input type="password" name="lgpswd" placeholder="Password" required="">
			<button>Login</button>
		</form>
	</div>
    </div>
</body>
</html>
