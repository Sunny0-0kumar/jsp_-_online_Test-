

<%@page  import="dao.RegUsersManager" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
         <jsp:useBean class="dto.RegUsers" id="u" scope="request"> </jsp:useBean>
            <jsp:setProperty name="u" property="*"></jsp:setProperty>
       
        
        <% 
            RegUsersManager mgr=new RegUsersManager();
            int z=mgr.saveuser(u);
            if(z>0)
            {
        %>
        <script>
            alert("Resistered successfully.");
            window.location="StudentLogin.jsp";
        </script>
        <% 
            }else {
            %>
            <jsp:include page="StudentReg.jsp"></jsp:include>
            <script>
                alert("Kindly fill all Entries Or,\nID is already exits ");
            </script>
            <%  
                }
                %>
         
    </body>
</html>
