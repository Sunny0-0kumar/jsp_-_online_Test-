

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
            <%
                String admin = request.getParameter("admin_id");
                String pass  = request.getParameter("pwd");
                
              if(!(admin=="" && pass=="")){
                
                if(admin.equals("admin") && pass.equals("pass")){  %>
                <jsp:forward page="AdminPanel.jsp" ></jsp:forward>
                
                <% } else { %>
                <script>
                    alert("Please enter valid admin id and password");
                    window.location="AdminLogin.jsp";
                </script>
               <%    }
            } else {
                    %>
               <script>
                    alert("Please enter admin id and password");
                    window.location="AdminLogin.jsp";
                </script>
                <%
            }
            %>
    </body>
</html>
