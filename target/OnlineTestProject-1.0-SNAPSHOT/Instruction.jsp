

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instruction</title>
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
              #a2{
                font-size: 6vw;
                position:fixed;
                top:17%;
                left:37%
            }
            #a3{
                background-color: #4a98f7;
                position: absolute;
                top: 10%;
                left:65%;
                height: 90%;
                width: 35%;
            }
            h2{
                position: absolute;
                top:3%;
                left:5%;
            }
            #a4{
                position: absolute;
                top:75%;
                left:45%;
                width:15%;
               
            }
            input[type="button"]{
                background-color: greenyellow;
                border-color: 1px solid grey;
                font-family: arial black;
                width:80%; 
            }
            #a5{
                position: absolute;
                top:76%;
                left:30%;
                color: red;
            }
                #b1{
               padding-top: 1%;    
               padding-right:2%; 
            }
            #b1 a{text-decoration: none;}
                #L{
              padding-top: 1%;       
              padding-right: 2%;
            }
            #L a{text-decoration: none;}
            @media(max-width:800px){
                #all{
                    font-size: 2rem; 
                }
                #b1{
                    font-size: 1rem;
                    padding-right: 4%;
                }
                #L{
                    font-size: 1rem;
                    padding-right: 4%;
                }
                    #a3{
                top: 10%;
                left: 0%;
                height: 70%;
                width: 100%;
                }
                    #a4{
                top:75%;
                left:70%;
                width:20%;
               
            }
                    #a5{
                top:76%;
                left:0%;
                color: red;
            }
                
            }
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
                <a href="index.jsp">
                        <font color="white"size="4px">Back</font>
                    </a>
            </div>
        </div>
        <div id="a2">
            <font color="black"face="Times New Roman">
            Get Ready</font>
        </div>
        <div id="a3">
            <h2><font color='white'>INSTRUCTIONS</font></h2><br><br><br><br><br>
            <ul type="square">
                <li>You have total 20 question to solve.<br>NOTE: All questions are compulsory.</li><br>
                <li>1 question have 1 mark that means each questions <br>contain equal marks.</li><br>
                <li>1 wrong can deduct (0.25) marks that means,<br>on 4 wrong 1 mark will be deducted.</li><br><!-- comment -->
                <li>Do not try to change your tab or,try to back when test<br>is going on,if you done you will be disqualify.</li><br><!-- comment -->
                <li>You have to save on each question you attempted,<br>otherwise answer will not count.</li><br><!-- comment -->
                <li>At last,if you finished all questions <br>you have to click on submit button.</li><br><br><!-- comment -->
            </ul>
            <center><h1><font color='green'>ALL THE BEST</font></h1></center>
        </div>
        <div id="a4">
            <center><input type="button"value="Start"onclick="location.href='Exam.jsp'"></center>
        </div>
        <div id="a5">On click Start button,test will start.</div>
    </body>
</html>
