

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Records</title>
        <style>
         
                   #a1{
                background-color: #5d58c9;
                position:fixed;
                width:100%;
                height:10%;
                top:1%;
                left:0%;
            }
               #a2{
                position: absolute;
                top: 14%;
                left:43%;
            }
                 #a3{
                position: absolute;
                top: 14%;
                left:77%;
            }
                #a11{
                position:absolute;
                top:28%;
                left:1%;
            }
                     #b1{
                position:absolute;
                top:60%;
                right:2%;
                
            }
                  button[id="delall"]{
                position: absolute;
                top: 30%;
                left: 28%;
                width: 8%;
            }
                button[id="del"]{
                position: absolute;
                top: 25%;
                left: 28%;
                width: 8%;
            }
            #m{
                position: absolute;
                top: 25%;
                left:37%;
            }
               #m1{
                position: absolute;
                top: 25%;
                left:70%;
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
        </style>
        <script>
function openDeleteDialog() {
  document.getElementById("deleteDialog").style.display = "flex";
}

function closeDeleteDialog() {
  document.getElementById("deleteDialog").style.display = "none";
}

function confirmDelete() {
  const id = document.getElementById("deleteResId").value;
  return confirm("Are you sure you want to delete result with ID: " + id + "?");
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
            <h1>Result Records</h1>
        </div>
        <div id="a3">
            <h1>Pass Records</h1>
        </div>
        
       <form method="post" action="DeleteAllResultInfo.jsp" onsubmit="return confirm('Are you sure you want to delete all result records ?');">
            <button id="delall" type="submit" >Delete All</button>
        </form>

                <button id="del" onclick="openDeleteDialog()">Delete</button>
        
        <div id="deleteDialog" class="dialog-overlay">
         <div class="dialog-box">
                
                <form action="deleteResultInfo.jsp" method="post" onsubmit="return confirmDelete()">
                  <hr>Delete Specific Record<hr><br> 
                 <input type="int" name="res_id" id="deleteResId" placeholder="Enter Result ID" required />
                        <br/><br/>
                <button type="submit">Delete</button>
                <button type="button" onclick="closeDeleteDialog()">Cancel</button>
                </form>
        </div>
    </div>
                
        <div id="m">
            <% 
                Connection con=mycon.MyConnection.getconnection();
                try{
                String sql = "select * from result";
                PreparedStatement ps=con.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();
                out.println("<table border='2px'>");
                out.println("<tr><th> Result ID </th><th> Student ID </th><th> Score </th><th> Total </th><th> Result </th><th> Time </th></tr>");
                while(rs.next()){
                    out.println("<tr><th>"+rs.getString("res_id")+"</th><th>"+rs.getString("stud_id")+"</th><th>"+rs.getDouble("score")+"</th><th>"+rs.getDouble("total")+"</th><th>"+rs.getString("result")+"</th><th>"+rs.getDate("date_taken")+"</th></tr>"); 
                }
                out.println("</table>");
                }catch(Exception ex){
                    out.println(ex);
                    }
                
            %>
        </div>
         <div id="m1">
            <% 
                Connection con1=mycon.MyConnection.getconnection();
                try{
                String sql = "select * from result where result='PASS'";
                PreparedStatement ps1=con1.prepareStatement(sql);
                ResultSet rs1=ps1.executeQuery();
                out.println("<table border='2px'>");
                out.println("<tr><th> Result ID </th><th> Student ID </th><th> Score </th><th> Total </th><th> Result </th><th> Time </th></tr>");
                while(rs1.next()){
                    out.println("<tr><th>"+rs1.getString("res_id")+"</th><th>"+rs1.getString("stud_id")+"</th><th>"+rs1.getDouble("score")+"</th><th>"+rs1.getDouble("total")+"</th><th>"+rs1.getString("result")+"</th><th>"+rs1.getDate("date_taken")+"</th></tr>"); 
                }
                out.println("</table>");
                }catch(Exception ex){
                    out.println(ex);
                    }
                
            %>
        </div>
    </body>
</html>
