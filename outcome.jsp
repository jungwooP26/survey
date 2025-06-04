<%@ page import="com.example.SurveyDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Survey Outcome</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Survey Outcome</h1>

        <%
            String chosenFruit = (String) request.getAttribute("chosenFruit");
            double applePercentage = (double) request.getAttribute("applePercentage");
            double grapePercentage = (double) request.getAttribute("grapePercentage");
            double strawberryPercentage = (double) request.getAttribute("strawberryPercentage");
            double melonPercentage = (double) request.getAttribute("melonPercentage");
            int totalVotes = (int) request.getAttribute("totalVotes");
        %>

        <!-- 결과 표시: 선택한 과일과 퍼센트 -->
        <div class="bar-container">
            <div class="bar" style="width: <%= applePercentage %>%; background-color: red;">Apple <%= String.format("%.1f", applePercentage) %>%</div>
            <div class="bar" style="width: <%= grapePercentage %>%; background-color: green;">Grape <%= String.format("%.1f", grapePercentage) %>%</div>
            <div class="bar" style="width: <%= strawberryPercentage %>%; background-color: blue;">Strawberry <%= String.format("%.1f", strawberryPercentage) %>%</div>
            <div class="bar" style="width: <%= melonPercentage %>%; background-color: yellow;">Melon <%= String.format("%.1f", melonPercentage) %>%</div>
        </div>

        <!-- 선택한 과일 표시 -->
        <p>You chose <strong style="color: <%= chosenFruit.equals("Apple") ? "red" : chosenFruit.equals("Grape") ? "green" : chosenFruit.equals("Strawberry") ? "blue" : "yellow" %>;"><%= chosenFruit %></strong>.</p>
        <p><%= totalVotes %> participant(s) join the survey.</p>

        <p><a href="index.jsp" class="btn">Home</a></p>
    </div>
</body>
</html>
