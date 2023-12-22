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

/**
 *
 * @author student
 */
public class CheckLogin1 extends HttpServlet {

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
        
        java.sql.Connection con;
        java.sql.Statement stmt;
        java.sql.ResultSet rs;
        String username,passwd,sql;
         boolean loginResult = false;
        username=request.getParameter("username");
        passwd=request.getParameter("password");
        sql="SELECT * FROM user WHERE NAME='"+username+"' AND password='"+passwd+"';";
         try{
            Class.forName("org.mariadb.jdbc.Driver");            
        }catch(ClassNotFoundException e ) {            
        }
        
         try{
           con=java.sql.DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb","root","12345");
           
           stmt = con.createStatement();
           
           rs=stmt.executeQuery(sql);
           if(rs.next())
           {
               loginResult=true;
           }
         }catch(java.sql.SQLException e){
             //out.print("連線失敗 : "+e.getMessage()+"<br>");
         }
         
          try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CheckLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>CheckLogin 會員登入結果</h1>");
            out.println("<h3>sql 語法: " + sql + "</h3>");
            out.println("<hr>");
            if( loginResult ) {
                out.print("<h3> 您已登入成功</h3>");
            } else {
                out.print("<h3> 您登入失敗</h3>");
            }
            out.println("</body>");
            out.println("</html>");
        }
        
        
        
        
        
        
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckLogin1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckLogin1 at " + request.getContextPath() + "</h1>");
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
