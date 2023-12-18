<%-- 
    Document   : cp2
    Created on : 2023年12月18日, 下午2:07:38
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page01</title>
    </head>
    <%!
       
       // 使用文字 宣告 作為預設密碼
       String [] users = { "user01", "user02","user03" };
       String [] pass  = { "123", "456" , "789" };
       // Dictionary  字典  Key --> Value ( user01 --> 123 )
       HashMap<String,String> userMap = new HashMap<>();       

       public boolean checkArray(String u, String p) {
            for(int i=0; i< users.length ; i++ ) {
                if( users[i].equals(u)) {
                    // 如果找到
                    if( pass[i].equals(p)) {
                      // 帳密正確
                      return true;
                    } else {
                      // 密碼錯誤
                      return false; // 帳號對 密碼錯
                    }
                } 
            }
            return false;  // 無此帳號
       }
       public boolean checkMap(String u, String p) {
            if( userMap.containsKey(u) ) {                
                if( userMap.get(u).equals(p) ) {
                    return true;
                }
            }
            return false;
       }
    %>
    <%
        userMap.put("user01", "123");
        userMap.put("user02", "456");
        userMap.put("user03", "789");
        userMap.put("kevin@gmail.com", "111");
        userMap.put("david","0975-123456");
        userMap.put("google","http://www.google.com.tw");
        
        // 取出 Login 表單送出的 帳密
        String user = request.getParameter("username");
        String pass = request.getParameter("pass");
        // 是否異常
        //檢查是否正確(帳密) 
        if (user == null || pass == null) {
    response.sendRedirect("nolog.html");
} else {
    if (checkMap(user, pass)) {
        session = request.getSession();
        session.setAttribute("username", user);
        session.setAttribute("isLogin", true);
        response.sendRedirect("page1.jsp");
    } else {
        response.sendRedirect("nolog.html");
    }
}
     
    
    %>
    <body>

    </body>
</html>

