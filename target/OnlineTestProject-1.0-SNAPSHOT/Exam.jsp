
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mycon.MyConnection" %>


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies


    if(session.getAttribute("exam_submitted") != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Test </title>
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
            #tt{padding-right: 3%;}
            #timer{
                color: white;
                font-weight: bold;
                font-size: 1.2rem;
            }
            #exam{
                position: absolute;
                top:14%;
                left:5%;
                
            }
            input[type="submit"]{
                position: absolute;
                bottom: 4%;
                left:240%; 
                background-color: greenyellow;
                border-color: 1px solid grey;
                font-family: Times New Roman;
                font-weight: bold;
            }
                    @media(max-width:768px){
                #a11{
                    font-size: 2rem;
                }
                #tt{
                    padding-right: 8%;
                }
                input[type="submit"]{
                    left: 100%;
                }
                
            }
        </style> 
        <script type="text/javascript">
           
    
    window.history.pushState(null, "", window.location.href);
    window.onpopstate = function () {
        alert("You cannot go back after the exam is submitted.");
         location.replace("index.jsp"); 
    };
       function handleFormSubmit() {
        // Clear storage
        sessionStorage.clear();
        localStorage.clear();

        // Optionally disable the submit button to prevent double submit
        const submitBtn = document.querySelector("input[type='submit']");
        submitBtn.disabled = true;
        submitBtn.value = "Submitting...";

        return true; // Continue form submission
    }
    
    
            let timeleft=1800;
            function startTimer(){
                const timerDisplay = document.getElementById("timer");
            
            const timer = setInterval(function (){
                let minutes = Math.floor(timeleft/60);
                let seconds = timeleft%60;
                
                timerDisplay.innerHTML =
                ( minutes < 10 ? "0"+minutes:minutes)+":"+
                ( seconds < 10 ? "0"+seconds:seconds);
                
               
                if(timeleft <= 0){
                    clearInterval(timer);
                    alert("Your time is up!\n    Thank you");
                    document.getElementById("exam").requestSubmit();
                }
                timeleft--;
            },1000);
            }
           window.onload = startTimer; 
        </script>
    </head> 
    
    <body>
         
        <div id="a1"> 
            <div id="a11">
                        <font color="white"size="6px">Online Test</font>  
            </div>
             <div id="tt"><span id="timer">30:00</span></div> 
        </div>
        
        <form id="exam" action="attempt.jsp" method="post" onsubmit="return handleFormSubmit();">
        
              
        <%
            
           Connection con=mycon.MyConnection.getconnection();
           try{
               PreparedStatement ps=con.prepareStatement("select * from question");
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                   int q_id = rs.getInt(1);
                   out.println("Q"+q_id+".  "+rs.getString(2)+"<br><br>");
                   out.println("<input type='hidden' name='q_ids' value='" + q_id + "'>");
                   out.println("<input type='radio'name='op"+q_id+"'value='1'>1. "+rs.getString(4)+"<br>");
                   out.println("<input type='radio'name='op"+q_id+"'value='2'>2. "+rs.getString(5)+"<br>");
                   out.println("<input type='radio'name='op"+q_id+"'value='3'>3. "+rs.getString(6)+"<br>");
                   out.println("<input type='radio'name='op"+q_id+"'value='4'>4. "+rs.getString(7)+"<br><br>");
                  
               }
           }catch(Exception ex){
               out.print(ex);
           }
          
        %>    
        <input type="submit" value="Submit" />
         </form>
        
    </body>
</html>
