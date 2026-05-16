USE UFC;

--TABLE 1
DROP TABLE IF EXISTS dim_fighters;

SELECT DISTINCT fighter_name,
    MAX(height_cms) AS height_cms,
    MAX(weight_lbs) AS weight_lbs,
    MAX(reach_cms) AS reach_cms,
    MAX(stance) AS stance,
    MAX(age) AS age
INTO dim_fighters
FROM (
    SELECT R_fighter AS fighter_name, R_Height_cms AS height_cms,
        R_Weight_lbs AS weight_lbs, R_Reach_cms AS reach_cms,
        R_Stance AS stance, R_age AS age
    FROM RawData
    UNION ALL
    SELECT B_fighter, B_Height_cms, B_Weight_lbs, 
        B_Reach_cms, B_Stance, B_age
    FROM RawData
) AS all_fighters
GROUP BY fighter_name;

-- TABLE 2
DROP TABLE IF EXISTS fact_fights;

SELECT 
    R_fighter, B_fighter, date, location, country,
    weight_class, gender, Winner, finish, finish_details,
    finish_round, total_fight_time_secs, R_odds, B_odds,
    title_bout, no_of_rounds
INTO fact_fights
FROM RawData;

-- TABLE 3
DROP TABLE IF EXISTS fighter_stats;

SELECT R_fighter AS fighter_name, date,
    R_avg_SIG_STR_landed AS avg_sig_str_landed,
    R_avg_TD_landed AS avg_td_landed,
    R_avg_SUB_ATT AS avg_sub_att,
    R_wins AS wins, R_losses AS losses,
    R_win_by_KO_TKO AS ko_wins,
    R_win_by_Submission AS sub_wins,
    R_win_by_Decision_Unanimous AS dec_wins,
    R_current_win_streak AS win_streak,
    R_current_lose_streak AS lose_streak
INTO fighter_stats
FROM RawData
UNION ALL
SELECT B_fighter, date,
    B_avg_SIG_STR_landed, B_avg_TD_landed, B_avg_SUB_ATT,
    B_wins, B_losses, B_win_by_KO_TKO, B_win_by_Submission,
    B_win_by_Decision_Unanimous, B_current_win_streak,
    B_current_lose_streak
FROM RawData;

