

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin_Panel</title>
            <style>
                         #a{
                position: absolute;
                background-color: #f7efc6;
                border:2px solid grey ;
                top: 33%;
                width: 43%;
                height: 37%;
                left:30%;
                
            }
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
                right:2%;
                
            }
                  #a2{
                font-size: 6vw;
                position:absolute;
                top:17%;
                left:32%
            }
                 #L{
                position:absolute;
                top:55%;
                left:89%;
            }
            input[type="button"]{
                position: absolute;
                height: 20%;
                width: 28%;
                
            }
            input[type="button"]:hover{background-color: yellowgreen;color: white;font-size: 1.1vw;}
            #s{position: absolute;left: 6%;top: 17%;}
            #q{position: absolute;left:36%; top: 17%;}
            #m{position: absolute;left: 66%;top: 17%;}
            #r{position: absolute;left: 6%; top:49%; }
            #s1{position: absolute;left: 36%; top:49%;}
            </style>
    </head>
    <body>
        <div id="a1"> 
              <div id="a11">
                        <font color="white"size="6px">Online Test</font>  
            </div>
              <div id="L">
                <a href="Logout.jsp">
                        <font color="white"size="4px">Logout</font>
                    </a>
            </div>
          <div id="b1">
                 <a href="AdminLogin.jsp">
                      <font color="white"size="4px">Back</font>
                    </a>
            </div>
        </div>
         <div id="a2">
            <font color="black"face="Times New Roman">
            ADMIN PANEL</font>
        </div>
        <div id="a">
            <input type="button" value="Student INFO" onclick="location.href='studentInfo.jsp'" id="s">
            <input type="button" value="Question setting" onclick="location.href='insertQuestion.jsp'" id="q">
            <input type="button" value="Marks setting" onclick="location.href='Setting.jsp'" id="m">
            <input type="button" value="Result INFO" onclick="location.href='ResultInfo.jsp'" id="r">
            <input type="button" value="Notice setting" onclick="location.href='Notice.jsp'" id="s1">
        </div>
    </body>
</html>
