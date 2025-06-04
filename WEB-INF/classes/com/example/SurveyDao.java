package com.example;

import java.sql.*;

public class SurveyDao {
    private static final String URL = "jdbc:mysql://localhost:3306/surveydb";
    private static final String USER = "root";
    private static final String PASSWORD = "password";

    public void updateVote(String fruit) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "UPDATE survey_results SET votes = votes + 1 WHERE fruit = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, fruit);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getVotes(String fruit) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT votes FROM survey_results WHERE fruit = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, fruit);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getInt("votes");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
