

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
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
            }
              #b{
        
                padding-right:37%;
                font-size: 3vw;
                font-family: Times New Roman;
                
            }
                #b1{
               padding-right: 3%;
            }
            #b1 a{
                text-decoration: none;
            }
                #c{
                background-color: #e0d8c5;
                position:fixed;
                top:22%;
                left:32%;
                width:35%;
                height:40%;
                display: flex;
                justify-content: center;
                border:1px solid black;
            }
            #c1{
                  background:linear-gradient(20deg,#5d58c9,#5d58c9,#5d58c9,white,#5d58c9);
                position:absolute;
                width:100%;
                height:12%;
                top:0%;
                left:0%;
            }
            #c11{
                  position:absolute;
                font-size: 1.5vw;
                font-family: Times New Roman;
                top:14%;
                left:3%;
            }
            #form1{
                
                position: absolute;
                left:32%;
                top:30%;
                width:36%;
                heigth:100%;
            }
           
            
            input[type="text"]{
                position:absolute;
                background-color: white;
                border:none;
                border-bottom: 1px solid grey;
                outline: none;
            }
               input[type="password"]{
                position:absolute;
                background-color: white;
                border:none;
                border-bottom: 1px solid grey;
                outline: none;
            }
            input[type="submit"]{
                position: absolute;
                background-color: transparent;
                border:none;
                outline:none;
                color: blue;
                left:32%;
            }
                    @media(max-width: 768px) {
              #c #form1{
                  left: 5%;
                }
              input[type="submit"]{
                    left: 3%;                  
                }
                #c11{
                    font-size: 1rem;
                }
                #b{
                    font-size: 2rem;
                    }
                input[type="text"]{
                       width: 150%; 
                 }
                input[type="password"]{
                        width: 150%;
                }
            }
        </style>
    </head>
    <body>
        <div id="a1">
            <div id="b"><font color="white">WELCOME</font></div>
             
            <div id="b1">
                 <a href="index.jsp">
                      <font color="white"size="4px">Back</font>
                    </a>
            </div>
        </div>
        
        <div id="c">
            <div id="c1">
            <div id="c11"><font color="white">Admin Login</font></div>
           </div> 
            <div id="form1">
                <form method="post"name="f1" action="logAdminSave.jsp">
                    <input type="text"name="admin_id" placeholder="Admin Id"><br><br><!-- comment -->
                    <input type="password"name="pwd"placeholder="Password"><br><br><br>
                    <input type="submit" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
