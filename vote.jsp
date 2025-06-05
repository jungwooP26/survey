<%@ page import="java.sql.*" %>
<%
    String fruit = request.getParameter("fruit");

    String dbURL = "jdbc:mysql://localhost:3306/surveydb";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String sql = "UPDATE fruits SET count = count + 1 WHERE name = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, fruit);
        pstmt.executeUpdate();

        conn.close();
    } catch (Exception e) {
        out.println("DB Error: " + e.getMessage());
    }

    session.setAttribute("selectedFruit", fruit);
    response.sendRedirect("outcome.jsp");
%>
