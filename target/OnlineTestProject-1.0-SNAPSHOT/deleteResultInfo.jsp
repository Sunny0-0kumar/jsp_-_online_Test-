

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Result Record</title>
    </head>
    <body>
        <%
                String resId=request.getParameter("res_id");
                int res_id=Integer.parseInt(resId);
                Connection con=mycon.MyConnection.getconnection();
                PreparedStatement ps=con.prepareStatement("delete from result where res_id=?");
                ps.setInt(1, res_id);
                 
                int rows = ps.executeUpdate();
                if(rows > 0){
                    %>
                    <script>
                        alert("rows successfully deleted");
                        window.location="ResultInfo.jsp";
                    </script>
                <% } else { %>
                        <script>
                        alert("No result found with this ID");
                         window.location="ResultInfo.jsp";
                        </script>
                <%    }
        %>
    </body>
</html>
