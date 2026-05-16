USE UFC;

DROP PROCEDURE IF EXISTS sp_GetFighterProfile;
GO

CREATE PROCEDURE sp_GetFighterProfile @p_fighter_name VARCHAR(100)
AS
BEGIN
    -- RESULT SET 1: Fighter Bio
    SELECT * FROM dim_fighters
    WHERE fighter_name = @p_fighter_name;

    -- RESULT SET 2: Career Performance Matrix
    SELECT * FROM v_fighter_performance_matrix
    WHERE fighter_name = @p_fighter_name;

    -- RESULT SET 3: Full Fight History
    SELECT 
        date,
        CASE 
            WHEN R_fighter = @p_fighter_name THEN B_fighter 
            ELSE R_fighter 
        END AS opponent,
        weight_class, 
        finish, 
        finish_details, 
        finish_round, 
        Winner
    FROM fact_fights
    WHERE R_fighter = @p_fighter_name 
       OR B_fighter = @p_fighter_name
    ORDER BY date DESC;
END;
GO
