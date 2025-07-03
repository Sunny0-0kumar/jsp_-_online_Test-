

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Marks</title>
        <style>
                #a1{
                background-color: #5d58c9;
                position:fixed;
                width:100%;
                height:10%;
                top:1%;
                left:0%;
            }
         
               #a11{
                position:absolute;
                top:28%;
                left:1%;
            }
            
                #b1{
                position:absolute;
                top:55%;
                left:95%;
            }
            form{
                position: absolute;
                top:36%;
                left: 41%;
                
            }
              input[type=submit]{
              position: relative;
              background-color: greenyellow;
              width: 100%;
            }
            #i{
                position: absolute;
                top: 36%;
                left: 70%;
            }
        </style>
    </head>
    <body>
        <div id="a1">
              <div id="b1">
                <a href="AdminPanel.jsp">
                        <font color="white"size="4px">Back</font>
                    </a>
            </div>
            <div id="a11">
                        <font color="white"size="6px">Online Test</font>  
            </div>
        </div>
        
        <form id="form" method="post">
            <table border="2px">
                <tr><td colspan="2" bgcolor="blue"><center><font color="white">SET MARKS</font></center></td>
                </tr>
                <tr>
                    <td>Positive Marks</td>
                    <th><input type="float" name="p" maxlength="4"></th>
                </tr>
                <tr>
                    <td>Negative Marks</td>
                    <th><input type="float" name="n" maxlength="5"></th>
                </tr>
                <tr>
                    <td>Pass percent</td>
                    <th><input type="float" name="percent" maxlength="3"></th>
                </tr>
                <tr>
                    <td colspan="2"><center><input type="submit" value="Set"></center></td>
                </tr>
            </table>
        </form>
        <div id="m">
            <% 
                String neg = request.getParameter("n");
                String pos = request.getParameter("p");
                String per = request.getParameter("percent");
                
                Connection con=mycon.MyConnection.getconnection();
                     
                        PreparedStatement ps1=con.prepareStatement("select nmarks,pmarks,percent from sett");
                        ResultSet rs1=ps1.executeQuery();
                        while(rs1.next()){
                            %>
                                <div id="i">
                                    <table border="2px">
                                        <tr>
                                            <th>Positive marks</th>
                                            <th>Negative marks</th><!-- comment -->
                                            <th>Pass Percent</th>
                                        </tr>
                                        <tr>
                                            <td><%= rs1.getFloat("pmarks") %></td><!-- comment -->
                                            <td><%= rs1.getFloat("nmarks") %></td><!-- comment -->
                                            <td><%= rs1.getFloat("percent") %></td>
                                        </tr>
                                    </table>
                                </div>
                        <%
                        }
                if(!(neg==" " && pos==" " && per==" "))
                {
                   try{    
                        float nmarks = Float.parseFloat(neg);
                        float pmarks = Float.parseFloat(pos);
                        float percent = Float.parseFloat(per);
                   
                        PreparedStatement ps=con.prepareStatement("update sett set nmarks = ?,pmarks = ?,percent = ? where sett_id=1");
                        ps.setFloat(1, nmarks);
                        ps.setFloat(2, pmarks);
                        ps.setFloat(3, percent);
                        
                        int x=ps.executeUpdate();
                        
                       if(x>0)
                       { %>
                        <script>
                            alert("Updated Successfully!");
                            window.location="Setting.jsp";
                        </script>
                   <%  } 
                    }catch(Exception ex){
                        out.println(ex);
                    }
                }
            %>
        </div>
    </body>
</html>
