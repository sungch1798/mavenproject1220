<%-- 
    Document   : login
    Created on : 2023年12月18日, 下午2:07:06
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page 01</title>
    </head>
    <body>
        <h1>您好~~請輸入您的會員帳號及密碼!!!</h1>
        <h3>您正在瀏覽的頁面為: <%=request.getRequestURI() %></h3><br>
        <h3>您從 <%=request.getHeader("Referer") %> 過來的</h3>
        <form method="post" action="CheckLogin2">
            帳號<input type="text" name="username" value="" />
            <br>
            <br>
            密碼<input type="password" name="password" value="" />
            <br>
            <br>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />
        </form>
    </body>
</html>
