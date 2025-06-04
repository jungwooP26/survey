<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vote for Your Favorite Fruit</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Select your favorite fruit</h1>
        <form action="outcome.jsp" method="POST">
            <input type="radio" name="fruit" value="Apple"> Apple<br>
            <input type="radio" name="fruit" value="Grape"> Grape<br>
            <input type="radio" name="fruit" value="Strawberry"> Strawberry<br>
            <input type="radio" name="fruit" value="Melon"> Melon<br>
            <input type="submit" value="VOTE" class="btn">
        </form>
    </div>
</body>
</html>
