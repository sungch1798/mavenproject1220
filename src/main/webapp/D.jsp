<%-- 
    Document   : D
    Created on : 2023年12月20日, 下午12:58:54
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP PageD</title>
    </head>
    <body style="text-align: center">
        <h1>抱歉!!登入失敗</h1>
        <h1>提   示   訊    息</h1>
        <H3><%= request.getAttribute("msg1") %></H3>
        <H3><%= request.getAttribute("msg2") %></H3>
        <H3><%= request.getAttribute("msg3") %></H3>
    </body>
</html>
