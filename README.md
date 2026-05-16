# UFC Database Mini Project:

##What it does:

Type a fighter's name, and it returns: 
- Bio (height, stance, reach, etc.)
- Career Stats (TKO/KO wins, SUB wins, win streak, finish rate, etc.)
- Fight history (every fight they've had in the UFC)


AND








Data Integrity Detection: 
- Uses validation logic via database triggers to detect invalid entries.

For example, if an invalid weight class is detected, this system will catch that error and send it into an 'Audit Log' where the correct classification will be shown.

Output:

<img width="1133" height="903" alt="image" src="https://github.com/user-attachments/assets/f81ffa37-a203-4a12-8a3d-b6fac0b25181" />



##How I did it (simplified):
- Took a UFC dataset with 8000+ rows and 100+ columns (Found on Kaggle.com)
- Normalized the data into a 3-table relational Star Schema: `dim_fighters`, `fact_fights`, and `fighter_stats` (Seen from `01_CreateTables.sql`) 
- Created an Aggregated View for performance analysis (Seen from `02_View.sql`)
- Created a Stored Procedure that returns a fighter's profile (Seen from `03_Stored_Procedure.sql`)
- Created a Trigger that catches invalid entries and sends it to an audit log (Seen from `04_Audit_Log.sql`)

##How to use it:

EXEC sp_GetFighterProfile 'Islam Makhachev';

Output:
 
<img width="1115" height="850" alt="image" src="https://github.com/user-attachments/assets/99beb399-587e-4055-9654-c756de216ae7" />
