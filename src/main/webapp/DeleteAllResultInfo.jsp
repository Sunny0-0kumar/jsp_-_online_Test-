

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete All Records</title>
    </head>
    <body>
        <%
            Connection con=mycon.MyConnection.getconnection();
            try{
                String sql = "delete from result";
                PreparedStatement ps = con.prepareStatement(sql);
                int x=ps.executeUpdate();
                if(x>0){
                %>
                <script>
                    alert("record deleted");
                    window.location="ResultInfo.jsp";
                </script>
               <% }else{
                            %>
                <script>
                    alert("No record found");
                    window.location="ResultInfo.jsp";
                </script>
               <%
                    }
            }catch(Exception ex){
                out.println(ex);
            }
        %>
    </body>
</html>

