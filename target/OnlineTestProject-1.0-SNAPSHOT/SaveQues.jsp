

<%@page  import="dao.InsertQuestManager" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert questions</title>
    </head>
    <body>
        <jsp:useBean class="dto.Quest" id="q" scope="request"> </jsp:useBean>
            <jsp:setProperty name="q" property="*"></jsp:setProperty>
       
        
        <% 
            InsertQuestManager qm = new InsertQuestManager();
            int z = qm.questsave(q);
            if(z>0)
            {
        %>
        <script>
            alert("record inserted");
            window.location="insertQuestion.jsp";
        </script>
        <% 
            }else {
            %>
            <script>
                alert("Something went wrong");
                window.location="insertQuestion.jsp";
            </script>
            <%  
                }
                %>
         
    </body>
</html>
