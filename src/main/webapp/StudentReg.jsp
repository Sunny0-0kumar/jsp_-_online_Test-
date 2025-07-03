

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
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
            #c{
                background-color: #e0d8c5;
                position:fixed;
                top:22%;
                left:32%;
                width:35%;
                height:48%;
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
            #form2{
                
                position: absolute;
                left:32%;
                top:26%;
                width:70%;
                height: 100%;
               
            }
            input[type="text"]{
                position:absolute;
                background-color: white;
                border:none;
                border-bottom: 1px solid grey;
                outline: none;
            }
                input[type="int"]{
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
                 
              #b1{
               padding-right: 3%;
            }
              #b1 a{
                text-decoration: none;
            }
             @media(max-width: 768px) {
              #c #form2{
                  left: 5%;
                }
             input[type="submit"]{
                 position: absolute;
                  top: 60%;
                  left: 2%;
                                      
                }
             input[type="reset"]{
                   position: absolute;
                  top: 60%;
                  left: 62%;
                }
                #c11{
                    font-size: 1rem;
                }
                #b{
                    font-size: 2rem;
                    }
                input[type="text"]{
                       width: 120%; 
                 }
                input[type="password"]{
                        width: 120%;
                }
                 input[type="int"]{
                        width: 120%;
                }
            }
        </style>
    </head>
    <body>
        <div id="a1">
            <div id="b1">
                <a href="index.jsp">
                        <font color="white"size="4px">Back</font>
                    </a>
            </div>
        </div>
        
        <div id="c">
            <div id="c1">
            <div id="c11"><font color="white">Student Registration</font></div>
           </div> 
            <div id="form2">
                <form method="post"action="save.jsp" name="f2">
                    <input type="text"name="stud_id" placeholder="Student Id"><br><br><!-- comment -->
                    <input type="text"name="stud_name"placeholder="Student Name"><br><br>
                    <input type="int"name="phone"placeholder="Phone number" maxlength="10"><br><br>
                    <input type="password"name="pwd"placeholder="Password"><br><br><br>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="submit"name="submit">&nbsp;
                    <input type="reset"value="Reset">
                </form>
            </div>
        </div>
        
        
    </body>
</html>
