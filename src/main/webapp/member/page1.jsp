<%-- 
    Document   : page1
    Created on : 2023年12月18日, 下午2:05:53
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page01</title>
    </head>
  <%! 
        HttpSession session; 
        String memberName;
        //Session=request.getSession();
    %>
    <%
       // 檢查特徵 如果欠缺該有的 設定 請使用者重新登入 
        session = request.getSession();
        if( session.getAttribute("username")== null ) {
            response.sendRedirect("/LoginDemo/member/nolog.html");
        } else {
                memberName = session.getAttribute("username").toString();
        }       
    %>
    <body>
        <h1 style="color: red">這裡是會員專區01!!</h1>
        <br>
        <h1 style="color: red">歡迎!!會員:  <%= memberName %> 登入會員系統!!</h1>
        <br>
        <h3>您正在瀏覽的頁面為: <%=request.getRequestURI() %></h3><br>
        <h3>您從 <%=request.getHeader("Referer") %> 過來的</h3><br>
        <h3 style="color: windowtext">使用者的資訊為: </h3>
        <br>
        <h3>您所使用的瀏覽器版本為:<%=request.getHeader("User-Agent")%></h3>
        <br>
        <h3>您所使用的瀏覽器版本為:<%=request.getHeader("Accept-Language")%></h3>
        <br>
        <h3>您所使用的IP為:<%=request.getRemoteAddr()%></h3>
        <br>
        <h3>TomcatEE 的IP為:<%=request.getLocalAddr()%></h3>
        <br>
        
        
        <script>
            alert("登入成功!! 歡迎回來!!");
        </script>
        
    </body>
</html>
