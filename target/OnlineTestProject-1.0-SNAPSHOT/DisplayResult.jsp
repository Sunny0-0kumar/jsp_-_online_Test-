

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <style>
            #d{
                position: absolute;
                top:15%;
                left: 12%;    
            }
        
        </style>
    </head>
    <body>
<%
    String stud_id = (String) session.getAttribute("sid");
    int total = 0;
    float positiveMarks = 0;
    float negativeMarks = 0;
    double tmarks = 0;
    double score = 0;
    double per=0;

    if (stud_id != null && !stud_id.trim().equals("")) {
        try {
            Connection con = mycon.MyConnection.getconnection();

            
            String sql1 = "SELECT nmarks, pmarks,percent FROM sett WHERE sett_id=1";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            float neg = 0, pos = 0, percentage = 0; 
            if (rs1.next()) {
                neg = rs1.getFloat("nmarks");
                pos = rs1.getFloat("pmarks");
                percentage = rs1.getFloat("percent");
            }
            request.setAttribute("percentage", percentage);
            rs1.close();
            ps1.close();
            
            String sqlTotal = "SELECT COUNT(*) AS total_q FROM question";
            PreparedStatement pstTotal = con.prepareStatement(sqlTotal);
            ResultSet rsTotal = pstTotal.executeQuery();
            if (rsTotal.next()) {
                total = rsTotal.getInt("total_q");  
            }
            rsTotal.close();
            pstTotal.close();

            
            String sql2 = "SELECT q_id, ansgiven FROM attempt WHERE stud_id = ?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, stud_id);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {
                int q_id = rs2.getInt("q_id");
                int givenAns = rs2.getInt("ansgiven");

                
                String sql3 = "SELECT ans FROM question WHERE q_id = ?";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                ps3.setInt(1, q_id);
                ResultSet rs3 = ps3.executeQuery();

                if (rs3.next()) {
                    int correctAns = rs3.getInt("ans");
                    
                    if (givenAns == correctAns) {
                        positiveMarks += pos;
                    } else {
                        negativeMarks += neg;
                    }
                }
                rs3.close();
                ps3.close();
            }

            rs2.close();
            ps2.close();

            score = positiveMarks - negativeMarks;
            tmarks = total * pos;
            per = (score/tmarks)*100;
            
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    }
%>

<%
    request.setAttribute("stud_id", stud_id);
    request.setAttribute("score", score);
    request.setAttribute("tmarks", tmarks);
    request.setAttribute("per", per);
    float percent = (Float) request.getAttribute("percentage");
    if(per >= percent){  %>
        <jsp:forward page="ResultDisp1.jsp" />
 <%   } else {  %>
        <jsp:forward page="ResultDisp2.jsp" />
<%}%>

</body>

</html>
