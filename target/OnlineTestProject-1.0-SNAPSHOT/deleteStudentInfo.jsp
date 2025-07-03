

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student Record</title>
    </head>
    <body>
        <%
                String studId=request.getParameter("stud_id");
                
                Connection con=mycon.MyConnection.getconnection();
                PreparedStatement ps=con.prepareStatement("delete from student where stud_id=?");
                ps.setString(1, studId);
                 
                int rows = ps.executeUpdate();
                if(rows > 0){
                    %>
                    <script>
                        alert("rows successfully deleted");
                        window.location="studentInfo.jsp";
                    </script>
                <% } else { %>
                        <script>
                        alert("No student found with this ID");
                         window.location="studentInfo.jsp";
                        </script>
                <%    }
        %>
    </body>
</html>
