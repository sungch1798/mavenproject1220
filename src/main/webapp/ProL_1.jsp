<%-- 
    Document   : ProL
    Created on : 2023年12月20日, 下午3:38:01
    Author     : student
--%>
<%@page import="com.mycompany.mavenproject1.productm"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mavenproject1.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
table {
  width:100%;
}
table, th, td {
  border: 3px solid dimgrey;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
#t01 tr:nth-child(even) {
  background-color: wheat;
}
#t01 tr:nth-child(odd) {
 background-color: whitesmoke;
}
#t01 th {
  background-color: yellowgreen;
  color: black;
}
</style>
    </head>
    <%!
         java.sql.Connection con = null;
           java.sql.ResultSet rs = null;
           Statement stmt = null;
          String productLine = null;
          String Url="";
          ArrayList<productm> rows = new ArrayList(); 
    %>
    <%
    String sql="Select * from classicmodels.products where productLine = '"; 
    
DBCon dbg=new DBCon();
con=dbg.getConnection();
stmt = con.createStatement();


try{
    rs = stmt.executeQuery("select productCode,productName,productScale,quantityInStock from classicmodels.products");
          while(rs.next()){
        productm pm=new productm();
        pm.pid=rs.getString("productCode");
        pm.pname=rs.getString("productName");
        pm.pscale=rs.getString("productScale");
        pm.qty=rs.getInt("quantityInStock");
        rows.add(pm);
        }
        rs.close();
        stmt.close();
        con.close();
        }catch(Exception e){
        }
        %>
    <body style="align-self: center">
        <h1>商品清單!</h1>
        <h1>查詢類型 : <%= productLine %></h1>
        <table id="t01">
         <tr>
        <th>產品編號</th>
        <th>產品名稱</th> 
        <th>產品比例</th>
        <th>產品庫存</th>
        <th>購物清單</th>
    
         </tr>
         <% for(productm pm:rows){%>
         <tr>
             <td><%= pm.pid %></td>
             <td><%= pm.pname %></td>
             <td><%= pm.pscale %></td>
             <td><%= pm.qty %></td>
             <td><a href="#">加入購物</a></td>
          </tr>
          <% } %>
  
        </table>
       目前共有 <%= rows.size() %> 筆模型資料
        
        
        
    </body>

</html>
