<%-- 
    Document   : login
    Created on : 04/05/2018, 14:12:18
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg="";
////login direto
if(request.getMethod().equals("POST")){
    if(request.getParameter("txtLogin").equals("admin")
            && request.getParameter("txtSenha").equals("123")){
        session.setAttribute("administrador", request.getParameter("txtLogin"));
        ////vai pra pag inicial
        
        response.sendRedirect("home/");
        return;
    }
    else{
        msg="Login/Senha errados cabeça ôca";
    }
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login das quebradas</h1>
        <%=msg%>
        <form action="#" method="post">
            <label>Login:</label>
            <input type="text" name="txtLogin"/>
            <br/>
            <label>Senha:</label>
            <input type="password" name="txtSenha"/>
            <br/>
            <button type="submit">OK
        </form>
    </body>
</html>
