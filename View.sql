USE UFC;

DROP VIEW IF EXISTS v_fighter_performance_matrix;
GO

CREATE VIEW v_fighter_performance_matrix AS
SELECT 
    fighter_name,
    COUNT(*) AS total_fights_in_dataset,
    MAX(CAST(wins AS FLOAT)) AS total_wins,
    MAX(CAST(losses AS FLOAT)) AS total_losses,
    MAX(CAST(ko_wins AS FLOAT)) AS ko_wins,
    MAX(CAST(sub_wins AS FLOAT)) AS sub_wins,
    MAX(CAST(dec_wins AS FLOAT)) AS dec_wins,
    MAX(win_streak) AS best_win_streak,
    ROUND(AVG(avg_sig_str_landed), 2) AS avg_strikes_landed,
    ROUND(AVG(avg_sub_att), 2) AS avg_sub_attempts,
    ROUND(AVG(avg_td_landed), 2) AS avg_takedowns,
    ROUND((MAX(CAST(ko_wins AS FLOAT)) + MAX(CAST(sub_wins AS FLOAT))) / 
           NULLIF(MAX(CAST(wins AS FLOAT)), 0) * 100, 2) AS finish_rate_pct
FROM fighter_stats
GROUP BY fighter_name;
GO

--REMEMBER** MAX() was used because the dataset has cumulative stats
