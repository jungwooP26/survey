CREATE DATABASE surveydb;
USE surveydb;

CREATE TABLE survey_results (
    fruit VARCHAR(50) PRIMARY KEY,
    votes INT
);

INSERT INTO survey_results (fruit, votes) VALUES
('Apple', 0),
('Grape', 0),
('Strawberry', 0),
('Melon', 0);
