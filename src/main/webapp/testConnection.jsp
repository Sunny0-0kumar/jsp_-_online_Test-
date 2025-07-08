<%@ page import="mycon.MyConnection" %>
<%@ page import="java.sql.Connection" %>
<%
  out.println("<h2>DB_URL    = " + System.getenv("DB_URL") + "</h2>");
  out.println("<h2>DB_USER   = " + System.getenv("DB_USER") + "</h2>");
  Connection c = null;
  try {
    c = MyConnection.getconnection();
    out.println("<h2>Connection object = " + c + "</h2>");
  } catch (Exception e) {
    out.println("<pre>Connection failed:<br>");
    e.printStackTrace(out);
    out.println("</pre>");
  }
%>
