-- This is a MySQL stored procedure named "ComputeAverageWeightedScoreForUser".
-- It takes one input parameter "user_id" and updates the "average_score" field
-- of the "users" table for the given user.

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
    UPDATE users set average_score = (SELECT
    SUM(corrections.score * projects.weight) / SUM(projects.weight)
    FROM corrections
    INNER JOIN projects
    ON projects.id = corrections.project_id
    where corrections.user_id = user_id)
    where users.id = user_id;
END $$
DELIMITER ;
