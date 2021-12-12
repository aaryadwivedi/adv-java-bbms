<%-- 
    Document   : index
    Created on : 12-Dec-2021, 7:27:43 pm
    Author     : Aarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="main">  	
	<input type="checkbox" id="chk" aria-hidden="true">
	<div class="signup">
        	<form>
                        <h1>Blood Bank</h1>
                	<label for="chk" aria-hidden="true">Sign up</label>
                        <input type="text" name="fname" placeholder="First name" required="">
                        <input type="text" name="lname" placeholder="Last name" required="">
                        <input type="date" name="dob" placeholder= "DOB" required="">
			<input type="email" name="email" placeholder="Email" required="">
			<input type="password" name="pswd" placeholder="Password" required="">
			<button>Sign up</button>
		</form>
	</div>
	<div class="login">
        	<form>
                	<label for="chk" aria-hidden="true">Login</label>
			<input type="email" name="email" placeholder="Email" required="">
			<input type="password" name="pswd" placeholder="Password" required="">
			<button>Login</button>
		</form>
	</div>
    </div>
</body>
</html>
