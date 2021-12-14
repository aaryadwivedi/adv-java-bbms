<%-- 
    Document   : admin
    Created on : 13-Dec-2021, 10:59:46 pm
    Author     : Aarya
--%>

<%@page import="com.crud.project.Request"%>
<%@page import="com.crud.project.RequestDao"%>
<%@page import="com.crud.project.UserDao"%>
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
List<Donor>ad=ddao.getAllD();
List<Donor>cd=ddao.getAllDC();
request.setAttribute("DONOR_LIST",dn);
request.setAttribute("ALL_DONOR",ad);
request.setAttribute("CONF_DONOR",cd);
%>
<% RequestDao rdao = new RequestDao(ConnectionDao.getCon());
List<Request>rn=rdao.getAllR();
List<Request>rd=rdao.getAllRequest();
request.setAttribute("REQUEST_LIST",rn);
request.setAttribute("CONF_RESQ",rd);

%>
<% bloodDao bdao = new bloodDao(ConnectionDao.getCon());
List<Blood>bd=bdao.getAllBlood();
request.setAttribute("BLOOD_LIST",bd);
%>
<% UserDao udao = new UserDao(ConnectionDao.getCon());
List<User>ud=udao.getAllUser();
request.setAttribute("USER_LIST",ud);
List<User>admin=udao.getAllAdmin();
request.setAttribute("ADMIN_LIST",admin);
%>
<% User user = (User) session.getAttribute("loguser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
    else
    {
        if(user.getAcc()==0)
        {
            response.sendRedirect("dashboard.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Bank</title>
        <link rel="stylesheet" type="text/css" href="css\admin.css">
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
            <li><a href="#users">Users</a></li>
            <li><a href="#req">Pending Requests</a></li>
            <li><a href="#data">Data</a></li>
            <li style="float:right"><a href="logout">Logout</a></li>
             <li style="float:right"><a href="editprofile.jsp">Hello, <%if(user!=null){out.println(user.getFname());}%></a></li>
        </ul>
        <div id="users">
            <div class="body">
                <div class="notmain">
                    <h2>User</h2>
                    <table>
                        <tr>
                          <th>User Id</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>Email</th>
                          <th>Action</th>

                        </tr>
                       <c:forEach var="tempU" items="${USER_LIST}">
                        <tr>
                          <td>${tempU.u_id}</td>
                          <td>${tempU.fname}</td>
                          <td>${tempU.lname}</td>
                          <td>${tempU.email}</td>
                          <td>
                              <button class="button button1"><a href="changetype?type=1&id=${tempU.u_id}">Change type</a></button>
                              <button class="button button3"><a href="delete?id=${tempU.u_id}">Remove</a></button>
                          </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="body">
                <div class="notmain">
                    <h2>Admin</h2>
                    <table>
                        <tr>
                          <th>User Id</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>Email</th>
                          <th>Action</th>

                        </tr>
                       <c:forEach var="tempU" items="${ADMIN_LIST}">
                        <tr>
                          <td>${tempU.u_id}</td>
                          <td>${tempU.fname}</td>
                          <td>${tempU.lname}</td>
                          <td>${tempU.email}</td>
                          <td>
                              <button class="button button1"><a href="changetype?type=0&id=${tempU.u_id}">Change type</a></button>
                              <button class="button button3"><a href="delete?id=${tempU.u_id}">Remove</a></button>
                          </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <hr width="80%">
        <div id="req">
            <div class="body">
            <div class="notmain">
                <h2>Pending Donors Request</h2>
                <table>
                    <tr>
                      <th>Donation Id</th>
                      <th>User Id</th>
                      <th>Blood type</th>
                      <th>Quantity</th>
                      <th>Date</th>
                      <th>Action</th>
                    </tr>
                    <c:forEach var="tempD" items="${ALL_DONOR}">
                    <tr>
                      <td>${tempD.d_id}</td>
                      <td>${tempD.u_id}</td>
                      <td>${tempD.type}</td>
                      <td>${tempD.quant}</td>
                      <td>${tempD.date}</td>
                      <td>
                          <button class="button button1"><a href="donorReq?id=${tempD.d_id}&stat=1&btype=${tempD.type}&quant=${tempD.quant}">Approve</a></button>
                          <button class="button button3"><a href="donorReq?id=${tempD.d_id}&stat=2">Reject</a></button>
                      </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
            <div class="body">
               <div class="notmain">
                   <h2>Pending Blood Request</h2>
                   <table>
                       <tr>
                            <th>Request Id</th>
                            <th>User Id</th>
                            <th>Blood type</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="tempD" items="${REQUEST_LIST}">
                        <tr>
                            <td>${tempD.r_id}</td>
                            <td>${tempD.u_id}</td>
                            <td>${tempD.type}</td>
                            <td>${tempD.quant}</td>
                            <td>
                                <button class="button button1"><a href="recReq?id=${tempD.r_id}&stat=1&btype=${tempD.type}&quant=${tempD.quant}">Approve</a></button>
                                <button class="button button3"><a href="recReq?id=${tempD.r_id}&stat=2">Reject</a></button>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <hr width="80%">
        <div id="data">
             <div class="body">
            <div class="notmain">
                <h2>Donors</h2>
                <table>
                    <tr>
                      <th>Donation Id</th>
                      <th>User Id</th>
                      <th>Blood type</th>
                      <th>Quantity</th>
                      <th>Date</th>
                      
                    </tr>
                    <c:forEach var="tempD" items="${CONF_DONOR}">
                    <tr>
                      <td>${tempD.d_id}</td>
                      <td>${tempD.u_id}</td>
                      <td>${tempD.type}</td>
                      <td>${tempD.quant}</td>
                      <td>${tempD.date}</td>
                      
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
         <div class="body">
            <div class="notmain">
                <h2>Blood Given</h2>
                <table>
                    <tr>
                      <th>Request Id</th>
                      <th>User Id</th>
                      <th>Blood type</th>
                      <th>Quantity</th>
                      
                    </tr>
                    <c:forEach var="tempD" items="${CONF_RESQ}">
                    <tr>
                      <td>${tempD.r_id}</td>
                      <td>${tempD.u_id}</td>
                      <td>${tempD.type}</td>
                      <td>${tempD.quant}</td>
                      
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
            <div class="body">
            <div class="notmain">
                <h2>Blood Availability</h2>
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
        </div>
    </body>
</html>

