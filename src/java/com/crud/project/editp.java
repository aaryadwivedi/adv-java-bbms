/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crud.project;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aarya
 */
public class editp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editp at " + request.getContextPath() + "</h1>");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loguser");
            int u_id=user.getU_id();   
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String pass=request.getParameter("pass");
            /*User nu = new User(u_id,fname,lname,pass);
            out.println(nu.u_id);
            out.println(nu.fname);
            out.println(nu.lname);
            out.println(nu.password);*/
            user.setFname(fname);
            user.setLname(lname);
            user.setPassword(pass);
             try{
                UserDao uo=new UserDao(ConnectionDao.getCon());
                if(uo.editUser(user)){
                out.println("Done");
                session.setAttribute("message","Updated successfully");
                response.sendRedirect("editprofile.jsp");
                //response.sendRedirect("dashboard.jsp?success=1");
                }
                else
                {
                    out.println("Not done");
                    session.setAttribute("error","Oops! Something went wrong");
                    response.sendRedirect("editprofile.jsp");
                }
            }catch(Exception e){
                e.printStackTrace();
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
