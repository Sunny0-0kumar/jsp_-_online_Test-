<%-- 
    Document   : ResultDisp2
    Created on : 06-Jun-2025, 8:23:38 pm
    Author     : hp
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mycon.MyConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
          <style>
                #a1{
                background-color: #5d58c9;
                position:fixed;
                width:100%;
                height:10%;
                top:0%;
                left:0%;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                z-index: 1;
            }
            #a11{
                position:absolute;
                top:28%;
                left:1%;
            }
                   #a{
                position: absolute;
                background-color: #f7efc6;
                border:2px solid grey ;
                top: 15%;
                width: 40%;
                height: 60%;
                left:30%;
                box-shadow: 3px 3px 5px black;
            }
                #a3{
                position: absolute;
                top:25%;
                left: 38%;
            }
            #a4{
                position: absolute;
                top: 8%;
                left: 30%;
                font-family: arial black;
                font-weight: bold;
                font-size: 3vw;
                color: skyblue;
            }
              #d{
                position: absolute;
                top:55%;
                left: 11%;    
            }
                  input[type="button"]{
                position: absolute;
                top:200%;
                left:43%;
                background-color: greenyellow;
                border-color: 1px solid grey;
                font-family: arial black;
            }
            @media(max-width:800px){
                #d{
                    left: 0;
                }
                #d table{
                    tab-size: 3; 
                }
                #a{
                    top:0;
                    left: 0;
                    width: 100%;
                    height: 80%;
                }
            }
        </style>
    </head>
    <body>
          <div id="a1"> 
            <div id="a11">
                        <font color="white"size="6px">Online Test</font>  
            </div>
        </div>
        <%
         String stud_id = (String) request.getAttribute("stud_id");
    double score = (Double) request.getAttribute("score");
    double tmarks = (Double) request.getAttribute("tmarks");
    double per = (Double) request.getAttribute("per");
    String f="FAIL";
      if(stud_id!=null){
              try{
                Connection con=mycon.MyConnection.getconnection();
               
                     
            String sql4 = "INSERT INTO result (stud_id, score, total,result) VALUES (?, ?, ?, ?)";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ps4.setString(1, stud_id);
            ps4.setDouble(2, score);
            ps4.setDouble(3, tmarks);
            ps4.setString(4, f);
            ps4.executeUpdate();

            ps4.close();
            con.close();
                
            
        }catch(Exception ex){
            out.println(ex);
        }
     }
        %>
     <div id="a"> 
         <div id="a3"><img src="images/fail.png"></div>
         <div id="a4">Oops!...</div>
        <div id="d">
            <table border="2px">
                <tr>
                    <th bgcolor="white">Student ID</th>
                    <th bgcolor="white">Obtained Marks</th>
                    <th bgcolor="white">Total Marks</th>
                    <th bgcolor="white">Percentage</th>
                    <th bgcolor="white">Result</th>
                </tr> 
                <tr>
                    <td bgcolor="white" align="center"><%= stud_id %></td>
                    <td bgcolor="white" align="center"><%= score %></td>
                    <td bgcolor="white" align="center"><%= tmarks %></td>
                    <td bgcolor="white" align="center"><%= String.format("%.2f",per) %>%</td>
                    <td bgcolor="white" align="center">FAIL</td>
                </tr>
            </table>
                        <input type="button" value="Finish" onclick="location.href='deleteAttemptRecord.jsp'">
    </div>
  </div>  
     </body>
</html>
