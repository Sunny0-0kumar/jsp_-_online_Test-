

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete_All_Questions</title>
    </head>
    <body>
        <%
           Connection con=mycon.MyConnection.getconnection();
              try{
                    PreparedStatement ps1=con.prepareStatement("delete from question");
                    int d=ps1.executeUpdate();
                    if(d > 0){
                            %>
                     <script>       
                         alert("all records deleted");
                         window.location="insertQuestion.jsp";
                     </script>           
                <%  } else {
                                          %>
                     <script>       
                         alert("Something went wrong");
                         window.location="insertQuestion.jsp";
                     </script>           
                <% 
                    }
               }catch(Exception ex){out.println(ex);}
        %>
    </body>
</html>
