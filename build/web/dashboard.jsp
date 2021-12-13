<%-- 
    Document   : dashboard
    Created on : 12-Dec-2021, 11:58:39 pm
    Author     : Aarya
--%>

<%@page import="com.crud.project.Blood"%>
<%@page import="com.crud.project.bloodDao"%>
<%@page import="com.crud.project.User"%>
<%@page import="com.crud.project.Donor"%>
<%@page import="java.util.List"%>
<%@page import="com.crud.project.DonorDao"%>
<%@page import="com.crud.project.ConnectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% DonorDao ddao = new DonorDao(ConnectionDao.getCon());
List<Donor>dn=ddao.getAllDonors();
request.setAttribute("DONOR_LIST",dn);
%>
<% bloodDao bdao = new bloodDao(ConnectionDao.getCon());
List<Blood>bd=bdao.getAllBlood();
request.setAttribute("BLOOD_LIST",bd);
%>
<% User user = (User) session.getAttribute("loguser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
    else
    {
        if(user.getAcc()==1)
        {
            response.sendRedirect("admin.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Bank</title>
        <link rel="stylesheet" type="text/css" href="css\dashboard.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
       <c:if test="${not empty message}">
            <div class="success">${message}</div>
            <c:remove var="message"/>
        </c:if>
            <c:if test="${not empty error}">
            <div class="error">${error}</div>
            <c:remove var="error"/>
        </c:if>
        <ul>
            <li><a class="active" href="dashboard.jsp">Dashboard</a></li>
            <li><a href="addD.jsp">Donate/Request</a></li>
            
            <li style="float:right"><a href="logout">Logout</a></li>
             <li style="float:right"><a href="#">Hello, <%if(user!=null){out.println(user.getFname());}%></a></li>
        </ul>
        <div class="body">
            <div class="notmain">
                <marquee scrollamount="20"><h2>Blood Availability</h2></marquee>
                <table>
                    <tr>
                      <th>Type</th>
                      <th>Quantity</th>
                    </tr>
                   <c:forEach var="tempB" items="${BLOOD_LIST}">
                    <tr>
                      <td>${tempB.type}</td>
                      <td>${tempB.quant}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        
        <div class="body">
            <div class="notmain">
                <marquee scrollamount="20"><h2>Last ten donors</h2></marquee>
                <table>
                    <tr>
                      <th>Donor Id</th>
                      <th>Blood type</th>
                      <th>Date</th>
                    </tr>
                    <c:forEach var="tempD" items="${DONOR_LIST}">
                    <tr>
                      <td>${tempD.u_id}</td>
                      <td>${tempD.type}</td>
                      <td>${tempD.date}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
