

<%@page import="mycon.MyConnection" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update_Student_Info</title>
    </head>
    <body>
        <%
            
    String qidStr = request.getParameter("q_id");
    String question = request.getParameter("ques");
    String answerStr = request.getParameter("ans");
    String option1 = request.getParameter("op1");
    String option2 = request.getParameter("op2");
    String option3 = request.getParameter("op3");
    String option4 = request.getParameter("op4");

    // Validation
    if (qidStr == null || qidStr.trim().isEmpty()) {
%>
        <script>
            alert("Question ID is required.");
            window.location = "insertQuestion.jsp";
        </script>
<%
        return;
    }

    if ((question == null || question.trim().isEmpty()) &&
        (answerStr == null || answerStr.trim().isEmpty()) &&
        (option1 == null || option1.trim().isEmpty()) &&
        (option2 == null || option2.trim().isEmpty()) &&
        (option3 == null || option3.trim().isEmpty()) &&
        (option4 == null || option4.trim().isEmpty())) {
%>
        <script>
            alert("Please provide at least one field to update.");
            window.location = "insertQuestion.jsp";
        </script>
<%
        return;
    }

    try {
        int qid = Integer.parseInt(qidStr.trim());
        int ans = -1;
        boolean hasAnswer = (answerStr != null && !answerStr.trim().isEmpty());

        if (hasAnswer) {
            try {
                ans = Integer.parseInt(answerStr.trim());
            } catch (NumberFormatException e) {
%>
                <script>
                    alert("Answer must be a valid number.");
                    window.location = "insertQuestion.jsp";
                </script>
<%
                return;
            }
        }

        Connection con = mycon.MyConnection.getconnection();
        StringBuilder sql = new StringBuilder("UPDATE question SET ");
        boolean first = true;

        if (question != null && !question.trim().isEmpty()) {
            sql.append("ques = ?");
            first = false;
        }
        if (hasAnswer) {
            if (!first) sql.append(", ");
            sql.append("ans = ?");
            first = false;
        }
        if (option1 != null && !option1.trim().isEmpty()) {
            if (!first) sql.append(", ");
            sql.append("op1 = ?");
            first = false;
        }
        if (option2 != null && !option2.trim().isEmpty()) {
            if (!first) sql.append(", ");
            sql.append("op2 = ?");
            first = false;
        }
        if (option3 != null && !option3.trim().isEmpty()) {
            if (!first) sql.append(", ");
            sql.append("op3 = ?");
            first = false;
        }
        if (option4 != null && !option4.trim().isEmpty()) {
            if (!first) sql.append(", ");
            sql.append("op4 = ?");
        }

        sql.append(" WHERE q_id = ?");

        PreparedStatement ps = con.prepareStatement(sql.toString());
        int i = 1;

        if (question != null && !question.trim().isEmpty()) ps.setString(i++, question.trim());
        if (hasAnswer) ps.setInt(i++, ans);
        if (option1 != null && !option1.trim().isEmpty()) ps.setString(i++, option1.trim());
        if (option2 != null && !option2.trim().isEmpty()) ps.setString(i++, option2.trim());
        if (option3 != null && !option3.trim().isEmpty()) ps.setString(i++, option3.trim());
        if (option4 != null && !option4.trim().isEmpty()) ps.setString(i++, option4.trim());

        ps.setInt(i, qid);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
%>
            <script>
                alert("Question updated successfully.");
                window.location = "insertQuestion.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("No such Question ID found.");
                window.location = "insertQuestion.jsp";
            </script>
<%
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
    </body>
</html>



