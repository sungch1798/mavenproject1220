/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mavenproject1;
import java.sql.*;

/**
 *
 * @author student
 */
public class DBCon {
    String username="root";
    String passwd="12345";
    String cst="jdbc:mariadb://127.0.0.1/webdb";
    public DBCon(){
    try{
    Class.forName("org.mariadb.jdbc.Driver");
    }catch(Exception e){
    
    }
    }
    
    public Connection getConnection(){
    Connection con;
    try{
    con = DriverManager.getConnection(cst,username,passwd);
            return con;
    }catch(Exception e){
        return null;
    }
    }
}
