<%-- 
    Document   : nolog
    Created on : 2023年12月18日, 下午2:06:38
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title001</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        new page 01
        <h1>您還不是會員!!</h1><br>
        <h1>請先加入會員，或確定帳號密碼正確!!</h1><br>
        <h1>10秒後導向會員登入頁面!!</h1><br>
        
        <script>
            //alert('java的簡易彈出視窗');
            function toLogin(){
                location.href="http://localhost:8081/LoginDemo/member/login.jsp";
            }
            setTimeout(toLogin,10000);
        </script>
    </body>
</html>

