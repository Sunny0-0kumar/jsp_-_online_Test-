<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notice Board</title>
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
                #a2{
                font-size: 5vw;
                position:absolute;
                top:17%;
                left:33%
            }
            form{
                position: absolute;
                top: 45%;
                left: 38%;
            }
            input[type='text']{
                width: 200%;
                height: 30px;
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
            <div id="a11">
                        <font color="white"size="6px">Online Test</font>  
            </div>
              <div id="b1">
                <a href="AdminPanel.jsp">
                        <font color="white"size="4px">Back</font>
                    </a>
            </div>
        </div>
          <div id="a2">
            <font color="black"face="Times New Roman">
            NOTICE BOARD</font>
        </div>
        <form method="post">
            <input type="text" name="notice1"><br><br>
            <input type="date" name="date"><br><br>
            <input type="submit" value="submit">
            <input type="reset" value="reset">
        </form>
        <div id="m">
            <%
                 String n1 = request.getParameter("notice1");
                String d1 = request.getParameter("date");
                
                Connection con=mycon.MyConnection.getconnection();
              
                    try{
                        
                      PreparedStatement ps=con.prepareStatement("select * from notice");
                      ResultSet rs=ps.executeQuery();
                      while(rs.next()){%>
                      <div id="i">
                      <table border="2px">
                          <tr>
                              <th>ID</th><!-- comment -->
                              <th>NOTICE</th><!-- comment -->
                              <th>DATE</th>
                          </tr>
                          <tr>
                              <td><%= rs.getString("n_id") %></td>
                              <td><%= rs.getString("n1") %></td>  
                              <td><%=rs.getDate("date_taken") %></td>
                          </tr>
                      </table>
                          </div>
                   <%   }  
                        
                    }catch(Exception ex){out.println(ex);}
                
                if (n1 != null && d1 != null && !n1.trim().isEmpty() && !d1.trim().isEmpty())
                {
                    try{
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date utilDate = formatter.parse(d1);
                        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                         
                        String sql = "update notice set n1=?,date_taken=? where n_id=1";
                        PreparedStatement ps1=con.prepareStatement(sql);
                        ps1.setString(1, n1);
                        ps1.setDate(2, sqlDate);
                        int x=ps1.executeUpdate();
                        if(x > 0){
                            %>
                            <script>
                               alert("Notice update successfully");     
                               window.location="Notice.jsp";
                            </script>
                    <%    }
                    }catch(Exception ex){out.println(ex);}

                }
                 
            %>
        </div>
    </body>
</html>
<%--
       if (n1 != null && d1 != null && !n1.trim().isEmpty() && !d1.trim().isEmpty())

                {
                   try{ 
                        
                       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date utilDate = formatter.parse(d1);
                        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

                        PreparedStatement ps=con.prepareStatement("update notice set n1 = ?,date_taken = ? where n_id=1");
                        ps.setString(1, n1);
                        ps.setDate(1, sqlDate);
                        
                        
                        int x=ps.executeUpdate();
                        
                       if(x>0)
                       { %>
                        <script>
                            alert("Updated Successfully!");
                            window.location="Notice.jsp";
                        </script>
                   <%  } 
                    }catch(Exception ex){
                        out.println(ex);
                    }
                }
--%>   