<%-- 
    Document   : Shopcar
    Created on : 2023年12月21日, 上午9:49:12
    Author     : student
--%>

<%@page import="com.mycompany.mavenproject1.cartitem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mycompany.mavenproject1.productm"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopCar</title>
         <style>
table {
  width:50%;
}
table, th, td {
  border: 2px solid black;
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
        ArrayList<cartitem> sc=null;
        String pid=null;
        String pname=null;
        boolean isDup = false;
    %>
    <%
        String user =(String) session.getAttribute("username");
    //HttpSession session=request.getSession();
    
    //Map<String,productm>shopcart=new HashMap<>();
    sc=(ArrayList)session.getAttribute("cart");
    
    if(sc==null){
        sc=new ArrayList();
        session.setAttribute("cart",sc );
        }
        pid=request.getParameter("pid");
        pname=request.getParameter("pname");
        
            if(sc.size()==0){
            cartitem cit = new cartitem(pid,pname,1);
            sc.add(cit);
            }else{
                 for(cartitem cti:sc){
                    if(cti.getPid1().equals(pid)){
                         cti.setQty1(cti.getQty1()+1);
                         isDup=true;
                         break;
                        }
                    }
            if(! isDup){
             cartitem cit = new cartitem(pid,pname,1);
             sc.add(cit);
             isDup=false;
        }
        }        
        
    %>
    
    
    <body>
      <h2> 您目前有  <%= sc.size() %>  項產品在購物車內</h2>
        <hr/>
        <% if(user==null){ %>
        <h2 style="background: red">提醒您 你目前尚未登入</h2>
        <% } %>
        <h2>您剛剛購買的商品是 : </h2>
        <table>
            <tr>
                <th>產品編號 : </th>
                <th>產品名稱 : </th>
                <th>產品數量 : </th>
            </tr>
            <tr>
                <td><%=  pid %></td>
                <td><%= pname %></td>
                <td>1</td>
            </tr>    
        </table><hr>
             <h1>您的購物車清單 : </h1>
              <table id="t01">
            <tr>
                <th>產品編號 : </th>
                <th>產品名稱 : </th>
                <th>數量 : </th>
               </table>

         <hr><br>
         <h5>您這邊過來的<%=request.getHeader("Referer") %></h5>
         <h3>點下方連結導引回之前搜尋商品頁面!!</h3>
         <a href="<%=request.getHeader("Referer") %>"><button>回產品清單</button></a>
    </body>
</html>
