


<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete_Question_Record</title>
    </head>
    <body>
        <%
                String qid=request.getParameter("q_id");
                
                Connection con=mycon.MyConnection.getconnection();
                PreparedStatement ps=con.prepareStatement("delete from question where q_id=?");
                ps.setString(1, qid);
                 
                int rows = ps.executeUpdate();
                if(rows > 0){
                    %>
                    <script>
                        alert("rows successfully deleted");
                        window.location="insertQuestion.jsp";
                    </script>
                <% } else { %>
                        <script>
                        alert("No question found with this ID");
                         window.location="insertQuestion.jsp";
                        </script>
                <%    }
        %>
    </body>
</html>

