<%-- 
    Document   : C
    Created on : 2023年12月20日, 下午12:58:46
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP PageC</title>

            
    </head>
    <body style="text-align: center">
        <BR>
        <h1>歡迎您!!恭喜登入成功!!</h1>
        <BR><HR>
        <h3><%= request.getParameter("msg") %></h3>
        <BR><HR>
        <h3>會員搜尋功能(完善中...)</h3>
        <BR><HR>
        <a href="https://www.google.com/search?q=Servlet"><button>Google Search Servlet</button></a>
         <BR><HR>
        <a href="https://www.google.com/search?q=JSP"><button>使用Google 搜尋 JSP</button></a>
         <BR><HR>
        <a href="https://www.google.com/search?q=SpringBoot"><button>使用Google 搜尋 SpringBoot</button></a>
         <BR><HR>
         
         <a href="ProQ.jsp"><button>前往商品區</button></a>
         
         <BR><HR>
         <h3>您的購物清單 : </h3>
         
    </body>
</html>
