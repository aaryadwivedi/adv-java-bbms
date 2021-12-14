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
public class recReq extends HttpServlet {

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
            out.println("<title>Servlet recReq</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet recReq at " + request.getContextPath() + "</h1>");
            int status=Integer.parseInt(request.getParameter("stat"));
            int u_id=Integer.parseInt(request.getParameter("id"));
            int quant=Integer.parseInt(request.getParameter("quant"));
            String btype=request.getParameter("btype");
            if(status==1)
            {
                //out.println(btype);
                
                try{
                    bloodDao b=new bloodDao(ConnectionDao.getCon());
                    int q=b.getBlood(btype);
                    quant=q-quant;
                    out.println(btype);
                    out.println(quant);
                    out.println(quant);
                    if(b.addBlood(btype,quant)){
                        out.println("Done");
                        //response.sendRedirect("dashboard.jsp?success=1");
                    }
                    else
                    {
                        out.println("Not Done");
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
            try{
                RequestDao udao=new RequestDao(ConnectionDao.getCon());
                if(udao.editStat(u_id,status)){
                    HttpSession session = request.getSession();
                    session.setAttribute("message","Successful");
                    response.sendRedirect("admin.jsp");
                    //response.sendRedirect("dashboard.jsp?success=1");
                }
                else
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("error","Oops! Something went wrong");
                    response.sendRedirect("admin.jsp");
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
