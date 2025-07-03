

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Questions</title>
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
            #a2{
                position: absolute;
                top: 14%;
                left:42%;
            }
            #form3{
                position: absolute;
                top:30%;
                left: 10%;
            }
                 #b1{
                position:absolute;
                top:55%;
                left:95%;
            }
            #shown{
                position: absolute;
                top: 60%;
                left: 10%; 
            }
            button[id="alldel"]{
                position: absolute;
                top: 19%;
                left:72%;
                width: 8%;
            }
             .dialog-overlay {
                display: none;
                position: fixed;
                top: 0; left: 0;
                width: 100vw; height: 100vh;
                background-color: rgba(0, 0, 0, 0.1);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .dialog-box {
                background: white;
                padding: 20px;
                min-width: 300px;
                text-align: center;
                border: 1px;
                box-shadow: 2px 2px 3px black;
            }
            button[id="del"]{
                position: absolute;
                top: 19%;
                left: 81%;
                width: 8%;
            }
                 button[id="u"]{
                position: absolute;
                top: 19%;
                left: 90%;
                width: 8%;
            }
        </style>
        <script>
            function openDeleteDialog() {
  document.getElementById("deleteDialog").style.display = "flex";
}

function closeDeleteDialog() {
  document.getElementById("deleteDialog").style.display = "none";
}

function confirmDelete() {
  const id = document.getElementById("deleteQid").value;
  return confirm("Are you sure you want to delete question with ID: " + id + "?");
}
function openUpdateDialog() {
  document.getElementById("updateDialog").style.display = "flex";
}

function closeUpdateDialog() {
  document.getElementById("updateDialog").style.display = "none";
}
        </script>
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
            <h1>Set Questions</h1>
        </div>
        <div id="form3">
            <form action="SaveQues.jsp" method="post">
                Q.no :&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"name="q_id">&nbsp;&nbsp;
                Question:&nbsp;<input type="text"name="ques"><br><br><!-- comment -->
                Answer:&nbsp;<input type="number"name="ans"><br><br>
                Options<br>
                option 1:<input type="text"name="op1">&nbsp;&nbsp;
                option 2:<input type="text"name="op2">&nbsp;&nbsp;  
                option 3:<input type="text"name="op3">&nbsp;&nbsp;
                option 4:<input type="text"name="op4"><br><br>
                <input type="submit"value="Submit">&nbsp;&nbsp;<input type="reset"value="Reset">
            </form>
        </div>
        <form action="DeleteAllQuestion.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete all questions from record ?');">
            <button id="alldel" type="submit" >Delete All</button>      
        </form>
        </div>
        
             <button id="del" onclick="openDeleteDialog()">Delete</button>
        
        <div id="deleteDialog" class="dialog-overlay">
         <div class="dialog-box">
                
                <form action="deleteQuestion.jsp" method="post" onsubmit="return confirmDelete()">
                  <hr>Delete Specific Record<hr><br> 
                 <input type="text" name="q_id" id="deleteQid" placeholder="Enter question number" required />
                        <br/><br/>
                <button type="submit">Delete</button>
                <button type="button" onclick="closeDeleteDialog()">Cancel</button>
                </form>
        </div>
    </div>
        
             <button id="u" onclick="openUpdateDialog()">Update</button>
            
            <div id="updateDialog" class="dialog-overlay">
            <div class="dialog-box">
            
            <form action="UpdateQuestion.jsp" method="post">
                
                <input type="int" name="q_id" placeholder="Question number" required /><br/><br/>
      
                <input type="text" name="ques" placeholder="New question (optional)" /><br/><br/>
      
                <input type="int" name="ans" placeholder="New answer (optional)" /><br/><br/>
                
                <input type="text" name="op1" placeholder="New option1 (optional)" /><br/><br/>
                
                <input type="text" name="op2" placeholder="New option2 (optional)" /><br/><br/>
                
                <input type="text" name="op3" placeholder="New option3 (optional)" /><br/><br/>
                
                <input type="text" name="op4" placeholder="New option4 (optional)" /><br/><br/>
      
                <button type="submit">Update</button>
                <button type="button" onclick="closeUpdateDialog()">Cancel</button>
    </form>
  </div>
</div>

             
        <div id="shown">
             <%
                Connection con = mycon.MyConnection.getconnection();
                try{
                
                    PreparedStatement ps=con.prepareStatement("select * from question");
                    ResultSet rs=ps.executeQuery();
                     while(rs.next()){
                    %>
                            
                                <lable><%= rs.getInt("q_id") %>. 
                                <%= rs.getString("ques") %>
                               Answer: <%= rs.getInt("ans") %> ;
                               option1: <%= rs.getString("op1") %> ;
                               option2: <%= rs.getString("op2") %> ;
                               option3: <%= rs.getString("op3") %> ;
                                option4: <%= rs.getString("op4") %> .</lable><br>
                             
               <%   }   
                }catch(Exception ex){out.println(ex);}
        %>  
        </div>
        
    </body>
</html>
