

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update_Student_Info</title>
    </head>
    <body>
        <%
            String studId = request.getParameter("stud_id");
            String stud_name = request.getParameter("student_name");
            String phone = request.getParameter("phone_number");
        
            if(studId == null || studId.trim().isEmpty()){
                out.println("student Id required.");
                return;
            }
             boolean hasName = stud_name != null && !stud_name.trim().isEmpty();
             boolean hasPhone = phone != null && !phone.trim().isEmpty();
        
             
            if (!hasName && !hasPhone) { %>
            <script>
                alert("Please provide values for update.");
                window.location="studentInfo.jsp";
             </script>
          <%  }
            
            try{
               Connection con = mycon.MyConnection.getconnection();
               
                String sql = "UPDATE student SET ";
                if (hasName) sql += "stud_name = ?";
                if (hasName && hasPhone) sql += ", ";
                if (hasPhone) sql += "phone = ?";
                sql += " WHERE stud_id = ?";
               
                PreparedStatement ps=con.prepareStatement(sql);
                int i = 1;
                if (hasName) ps.setString(i++, stud_name);
                if (hasPhone) ps.setString(i++, phone);
                ps.setString(i, studId);
                
                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) { %>
                     <script>
                alert("Row successfully updated.");
                window.location="studentInfo.jsp";
             </script>
             <%   } else {
                     %>
                     <script>
                alert("No such Id found.");
                window.location="studentInfo.jsp";
             </script>
             <%
                }
            }catch(Exception ex){
                out.println(ex);
            }
        %>
    </body>
</html>
