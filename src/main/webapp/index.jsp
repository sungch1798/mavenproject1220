<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page01</title>
    </head>
    <body>
        <h1 style="color: blue">會員登入系統001!!</h1>
        <h3>您正在瀏覽的頁面為: <%=request.getRequestURI() %></h3><br>
        <h3>您從 <%=request.getHeader("Referer") %> 過來的</3><br>
        <h3><a href="member/login.jsp"><button style="width: 200px">會員系統01</button></a></h3>
        <h3>現在時間為 : </h3><h3 id="demo"></h3>
        <script>
setInterval(myTimer, 1000);

function myTimer() {
  const d = new Date();
  document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}
</script>
    </body>
    
</html>
