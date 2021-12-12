<%-- 
    Document   : dashboard
    Created on : 12-Dec-2021, 11:58:39 pm
    Author     : Aarya
--%>

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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Bank</title>
         <link rel="stylesheet" type="text/css" href="dashboard.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <ul>
            <li><a class="active" href="dashboard.jsp">Dashboard</a></li>
            <li><a href="addD.jsp">Donate</a></li>
            <li><a href="addD.jsp">Request</a></li>
            <li><a href="#about">Logout</a></li>
         </ul>
        
        <div class="body">
            <div class="notmain">
                <marquee scrollamount="20"><h2>Blood Availability</h2></marquee>
                <table>
                    <tr>
                      <th>Firstname</th>
                      <th>Lastname</th>
                      <th>Savings</th>
                    </tr>
                    <tr>
                      <td>Peter</td>
                      <td>Griffin</td>
                      <td>$100</td>
                    </tr>
                </table>
            </div>
        </div>
        <c:if test="${not empty message}">
            <h3 style='color:green'>${message}</h3>
            <c:remove var="message"/>
        </c:if>
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
                      <td>${tempD.d_id}</td>
                      <td>${tempD.type}</td>
                      <td>${tempD.date}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
