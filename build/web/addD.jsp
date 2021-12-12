<%-- 
    Document   : addD.jsp
    Created on : 12-Dec-2021, 9:02:44 pm
    Author     : Aarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank</title>
    <link rel="stylesheet" type="text/css" href="addD.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
    <ul>
         <li><a href="dashboard.jsp">Dashboard</a></li>
         <li><a class="active" href="addD.jsp">Donate</a></li>
         <li><a href="addD.jsp">Request</a></li>
         <li><a href="#about">Logout</a></li>
    </ul>
    <div class="body">
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="signup">
                    <form action="AddDonor" method="post">
                            <h1>Blood Bank</h1>
                            <label for="chk" aria-hidden="true">Donate</label>
                            <input type="number" name="u_id" placeholder="User id" required="">
                            <input type="date" name="donordate" placeholder="Date" required="">
                            <select name="donortype" required="">
                                <option selected disabled hidden>Blood Group</option>
                                <option value="a+">A+</option>
                                <option value="b+">B+</option>
                                <option value="ab+">AB+</option>
                                <option value="o+">O+</option>
                                <option value="a-">A-</option>
                                <option value="b-">B-</option>
                                <option value="ab-">AB-</option>
                                <option value="o-">O-</option>
                            </select>
                            <input type="number" name="donorquant" placeholder= "Quantity" required="">
                            <button>Add</button>
                    </form>
            </div>
            <div class="login">
                    <form>
                            <label for="chk" aria-hidden="true">Request</label>
                            <select name="reqtype" required="">
                                <option selected disabled hidden>Blood Group</option>
                                <option value="a+">A+</option>
                                <option value="b+">B+</option>
                                <option value="ab+">AB+</option>
                                <option value="o+">O+</option>
                                <option value="a-">A-</option>
                                <option value="b-">B-</option>
                                <option value="ab-">AB-</option>
                                <option value="o-">O-</option>
                            </select>
                            <input type="number" name="reqquant" placeholder="Quantity" required="">
                            <button>Check Availability</button>
                    </form>
            </div>
        </div>
    </div>
</body>
</html>

