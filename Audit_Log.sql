USE UFC;

DROP TABLE IF EXISTS audit_log;

CREATE TABLE audit_log (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    log_date DATETIME DEFAULT GETDATE(),
    fighter_name VARCHAR(100),
    listed_weight_class VARCHAR(50),
    actual_weight_lbs FLOAT,
    issue VARCHAR(255)
);

GO

DROP TRIGGER IF EXISTS tr_CheckWeightClass;
GO

CREATE TRIGGER tr_CheckWeightClass
ON fact_fights
AFTER INSERT
AS
BEGIN
    INSERT INTO audit_log (fighter_name, listed_weight_class, actual_weight_lbs, issue)
    SELECT 
        i.R_fighter,
        i.weight_class,
        d.weight_lbs,
        'Weight class mismatch detected'
    FROM inserted i
    JOIN dim_fighters d ON d.fighter_name = i.R_fighter
    WHERE 
        (i.weight_class = 'Flyweight' AND d.weight_lbs > 125)
        OR (i.weight_class = 'Bantamweight' AND d.weight_lbs > 135)
        OR (i.weight_class = 'Featherweight' AND d.weight_lbs > 145)
        OR (i.weight_class = 'Lightweight' AND d.weight_lbs > 155)
        OR (i.weight_class = 'Welterweight' AND d.weight_lbs > 170)
        OR (i.weight_class = 'Middleweight' AND d.weight_lbs > 185)
        OR (i.weight_class = 'Light Heavyweight' AND d.weight_lbs > 205);
END;
GO

