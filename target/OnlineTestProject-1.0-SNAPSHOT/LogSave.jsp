

<%@page  import="dao.LoginManager" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <jsp:useBean class="dto.RegUsers" id="u1" scope="request"> </jsp:useBean>
            <jsp:setProperty name="u1" property="*"></jsp:setProperty>         
    
            <%
                String stud_id = request.getParameter("stud_id");
                LoginManager log=new LoginManager();
                int y = log.savelogin(u1);
                if(y>0){
                    session.setAttribute("sid",stud_id );
                %>
                <jsp:forward page="Instruction.jsp"></jsp:forward>
             <%   }else{
             %>   
             <script>
                 alert("Error\nPlease check your registered id or password");
                 window.location="StudentLogin.jsp";
             </script>
             <% } %>
    </body>
</html>
