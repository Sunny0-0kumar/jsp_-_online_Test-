

<%@page   contentType="text/html" pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies

 
%>


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
                top: 13%;
                width: 30%;
                height: 80%;
                left:35%;
            }
                 #a2{
                font-size: 3vw;
                position:absolute;
                top:2%;
                left:3%;
            }
            #a3{
                position: absolute;
                top:37%;
                left: 36%;
            }
            #a4{
                position: absolute;
                top:65%;
                left:17%;
            }
            input[type="submit"]{
                position: absolute;
                top:75%;
                left:40%;
                background-color: greenyellow;
                border-color: 1px solid grey;
                font-family: arial black;
            }
                #L{
              padding-top: 1%;       
              padding-right: 2%;
            }
            #L a{text-decoration: none;}
             @media(max-width:800px){
                #all{
                    font-size: 2rem; 
                }
                   #L{
                    font-size: 1rem;
                    padding-right: 4%;
                }
                      #a2{
                font-size: 1.5rem;
                left:2%;
            }
             #a3{
                top:37%;
                left: 10%;
            }
              #a4{
                top:55%;
                left:17%;
            }
               input[type="submit"]{
                left:35%;
            }
         }   
        </style>
        <script>
            window.history.pushState(null, "", window.location.href);
            window.onpopstate = function () {
                window.location.replace("Logout.jsp");
        };
            document.addEventListener("visibilitychange",fuction(){
                if(document.hidden){
                    window.location.replace("Logout.jsp");
                }
            });
        </script>
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
        </div> 
        <div id="a">
             <div id="a2">
                <font color="black"face="Times New Roman">
                Your response is <br>submitted.</font>
             </div>
            <div id="a3"><img src="images/smile3.png"></div>
            <div id="a4">
                <font color="red">Check your result, On click result button.<br>Good Luck...</font>
            </div>
            <input type="submit"value="Result"onclick="location.href='DisplayResult.jsp'">
        </div>
    
    </body>
</html>
