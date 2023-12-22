<%-- 
    Document   : ProL
    Created on : 2023年12月20日, 下午3:38:01
    Author     : student
--%>
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
  border: 1px solid black;
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
  background-color: #569bf5;
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
    %>
    <%
    int plt = Integer.valueOf( request.getParameter("pl") );
    String sql="Select * from classicmodels.products where productLine = '"; 
    
DBCon dbg=new DBCon();
con=dbg.getConnection();
stmt = con.createStatement();

switch(plt){
    case 1:
        productLine="Classic Cars";
        sql=sql+productLine+"';";
        break;
        case 2:
        productLine="Motorcycles";
        sql=sql+productLine+"';";
        break;
        case 3:
        productLine="Planes";
        sql=sql+productLine+"';";
        break;
        case 4:
        productLine="Ships";
        sql=sql+productLine+"';";
        break;
        case 5:
        productLine="Trains";
        sql=sql+productLine+"';";
        break;
        case 6:
        productLine="Trucks and Buses";
        sql=sql+productLine+"';";
        break;
        case 7:
        productLine="Vintage Cars";
        sql=sql+productLine+"';";
        break;
      
        
        
        
        

}
try{
rs=stmt.executeQuery(sql);
        }catch(Exception e){}
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
        <th>產品售價</th>
        <th>購物清單</th>
    
         </tr>
         <% try{
         while(rs.next()){
         Url="Shopcar.jsp?pid="+rs.getString("productCode")+"&pname="+rs.getString("productName")+"&pscale="+rs.getString("productScale")+
         "&pqs="+rs.getInt("quantityInStock")+"&msrp="+rs.getBigDecimal("MSRP").toString();
        %>

        <tr>
         <td><%= rs.getString("productCode") %></td>
        <td><%= rs.getString("productName") %></td> 
        <td><%= rs.getString("productScale") %></td>
        <td><%= rs.getInt("quantityInStock") %></td>
        <td><%= rs.getBigDecimal("MSRP").toString() %></td>
        <td><a href="<%= Url %>"><button>加入購物車</button></a></td>
        </tr>
        <% }


rs.close();
stmt.close();
con.close();
}catch(Exception e){}
%>
        </table>
        
        
        
        
    </body>

</html>
