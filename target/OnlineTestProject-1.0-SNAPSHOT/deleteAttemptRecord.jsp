

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
               
               
               try{
                  Connection con = mycon.MyConnection.getconnection();
                  
                  String sql = "delete from attempt";
                  PreparedStatement ps=con.prepareStatement(sql);
                  int x = ps.executeUpdate();
                  if(x>0){
                        session.invalidate();
                        response.sendRedirect("index.jsp");
                  }
                  
               }catch(Exception ex){
                   out.println(ex);
               }
       %>
    </body>
</html>
