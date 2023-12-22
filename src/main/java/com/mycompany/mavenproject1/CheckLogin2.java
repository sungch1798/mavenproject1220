/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.mavenproject1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author student
 */
public class CheckLogin2 extends HttpServlet {
    Connection dbcon;
    DBCon dbgen;
    Statement stmt;
    ResultSet rs;
    String username,passwd,sql;

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
        dbgen=new DBCon();
        dbcon=dbgen.getConnection();
        
         username = request.getParameter("username");
        passwd = request.getParameter("password");
        sql = "SELECT * FROM user WHERE NAME='" + username + "' AND password='" + passwd + "';";
        
        try{
        stmt=dbcon.createStatement();
        rs=stmt.executeQuery(sql);
        //String message = "Wellcom To Member Web Side!!";
        String message = "歡迎會員登入!! 請使用下面功能!!";
        
        if(rs.next()){
        // RequestDispatcher disp1= request.getRequestDispatcher("C.jsp?msg1="+message );
                //disp1.forward(request, response);
        RequestDispatcher disp= request.getRequestDispatcher("C.jsp?msg="+java.net.URLEncoder.encode(message, "UTF-8") );
                disp.forward(request, response);
                }
        else{
           request.setAttribute("msg1","請確認帳號密碼是否正確，或聯絡管理員admin@gmail.com  !!");
           request.setAttribute("msg2","或於上班時間電洽 04-2211205 分機105 !!");
           request.setAttribute("msg3","或返回登入頁面重新登入帳號密碼!!");
         request.getRequestDispatcher("D.jsp").forward(request, response);
        }
        
        }catch(Exception e){
            
        }
        
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>會員登入系統02</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>會員登入結果 : </h1>");
            out.println("<h1>Servlet CheckLogin2 at " + request.getContextPath() + "</h1>");
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
