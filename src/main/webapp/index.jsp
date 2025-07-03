

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OnlineTest</title>
       <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: 'Times New Roman', serif;
                background-color: #f6fae8;
            }

            #a1 {
                background-color: #5d58c9;
                position: fixed;
                width: 100%;
                height: 10%;
                top: 0;
                left: 0;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                padding-right: 5%;
                z-index: 1000;
            }

            #a11 {
                display: flex;
                gap: 10px;
                justify-content: flex-start;
               
            }

            #a11 a {
                color: white;
                font-size: 1rem;
                text-decoration: none;
                padding: 0px;
            }

            #a2 {
                font-size: 6vw;
                position: relative;
                top: 12vh;
                left: 0;
                width: 100%;
                text-align: center;
                color: black;
            }

            #m {
                margin-top: 15vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 0 5%;
                gap: 20px;
            }

            #c {
                background-color: white;
                width: 100%;
                max-width: 500px;
                height: auto;
                border: 1px solid black;
                padding: 15px;
                text-align: center;
                box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
            }

            #c u {
                font-weight: bold;
            }

            #c font {
                color: red;
            }

            @media (min-width: 768px) {
                #a2 {
                    font-size: 5vw;
                }

                #a11 a {
                    font-size: 2rem;
                    
                }

                #c {
                    width: 35%;
                }
            }
        </style>
    </head>
    <body>
        <div id="a1"> 
            <div id="a11">
                 <a href="StudentLogin.jsp"><font color="white"size="4px">Student Login</font></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminLogin.jsp">
                        <font color="white"size="4px">Admin</font>
                    </a>
            </div>   
        </div>
        <div id="a2">
            <font color="black"face="Times New Roman">
            Online Test</font>
        </div>
        <div id="m">
            <%
                Connection con=mycon.MyConnection.getconnection();
                try{
                    String sql="select n1,date_taken from notice";
                    PreparedStatement ps=con.prepareStatement(sql);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){%>
                          <div id="c">
                              <center><b><u>NOTICE</u></b><center><br>
                         <font color="red"><%= rs.getString("n1") %>&nbsp;&nbsp;&nbsp;<%= rs.getDate("date_taken") %></font>
                         </div>
                  <%  }
                }catch(Exception ex){out.println(ex);}
            %>
        </div>
      
        
    </body>
</html>
