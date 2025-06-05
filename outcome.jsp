<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/surveydb";
    String dbUser = "root";
    String dbPass = ""; // 본인 비밀번호 입력

    Map<String, Integer> votes = new LinkedHashMap<>();
    Map<String, String> colors = new HashMap<>();
    colors.put("Apple", "#40E0D0");
    colors.put("Grape", "#9999FF");
    colors.put("Strawberry", "#FF9999");
    colors.put("Melon", "#FF6666");

    int total = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT name, count FROM fruits");

        while (rs.next()) {
            String name = rs.getString("name");
            int count = rs.getInt("count");
            votes.put(name, count);
            total += count;
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("DB Error: " + e.getMessage());
    }

    String selected = (String)session.getAttribute("selectedFruit");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Outcome</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            background-color: #f5f5f5;
        }
        .result-table {
            display: inline-block;
            text-align: left;
            margin-top: 20px;
        }
        .row {
            display: flex;
            align-items: center;
            margin: 4px 0;
        }
        .label-box {
            width: 140px; /* ✅ 넓혀서 퍼센트까지 한 줄에 표시 */
            height: 20px;
            line-height: 20px;
            text-align: center;
            color: black;
            font-weight: bold;
        }
        .bar-box {
            background-color: royalblue;
            height: 20px;
            margin-left: 10px;
        }
        .result {
            margin-top: 30px;
            font-size: 16px;
        }
        .highlight {
            font-weight: bold;
        }
        .home-link {
            display: inline-block;
            margin-top: 30px;
            font-size: 18px;
            color: red;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h2>Survey Outcome</h2>

    <div class="result-table">
    <%
        for (Map.Entry<String, Integer> entry : votes.entrySet()) {
            String fruit = entry.getKey();
            int count = entry.getValue();
            int percent = (total == 0) ? 0 : (count * 100 / total);
            String labelColor = colors.get(fruit);
    %>
        <div class="row">
            <div class="label-box" style="background-color:<%= labelColor %>;">
                <%= fruit %> <%= percent %>%
            </div>
            <div class="bar-box" style="width:<%= percent * 3 %>px;"></div>
        </div>
    <%
        }
    %>
    </div>

    <div class="result">
        You chose <span class="highlight" style="color:<%= colors.get(selected) %>;"><%= selected %></span>.<br>
        <%= total %> participant(s) join the survey.
    </div>

    <a class="home-link" href="opinion.html">Home</a>
</body>
</html>
