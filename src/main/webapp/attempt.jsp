

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import=" javax.servlet.*, javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>attempt</title>
      
    </head>
    <body>
            <%
                String stud_id = (String) session.getAttribute("sid");

                if (stud_id != null && !stud_id.trim().equals("")) {
                String[] q_ids = request.getParameterValues("q_ids");

                    try {
                         Connection con = mycon.MyConnection.getconnection();

                         for (String q_id_str : q_ids) {
                                int q_id = Integer.parseInt(q_id_str);
                                String selectAns = request.getParameter("op" + q_id);

                                    if (selectAns != null && !selectAns.trim().equals("")) {
                                         PreparedStatement ps2 = con.prepareStatement(
                                                "INSERT INTO attempt(stud_id, q_id, ansgiven) VALUES (?, ?, ?)"
                                                    );
                                                ps2.setString(1, stud_id);
                                                ps2.setInt(2, q_id);
                                                ps2.setInt(3, Integer.parseInt(selectAns));

                                                ps2.executeUpdate();
                                                ps2.close();
                                             }
                                        }

                                        con.close();
       
                                         session.setAttribute("exam_submitted", true);
                                         response.sendRedirect("result.jsp");

                                            } catch (Exception ex) {
                                                 out.println("Error: " + ex.getMessage());
                                            }
                                        } else {
                                            out.println("Student ID not found in session.");
                                        }
%>
    </body>
</html>
