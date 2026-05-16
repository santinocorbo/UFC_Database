# UFC Database Mini Project:

//What it does:

Type a figthers name and it returns: 
- Bio (height, stance, reach, etc.)
- Career Stats (TKO/KO wins, SUB wins, win streak,finish rate etc.)
- Fight history (every fight theyve had in the UFC)

AND

If the Dataset misktakes a fighters weightclass, the error will be caught and sent to an "audit log" where the correct weightclass is shown. 


//How I did it (simplified):
- Took a UFC dataset with 8000+ rows and 100+ columns (Found on Kaggle.com)
- Sorted data into 3 tables: dim_fighters, fact_fights and fighter_stats (Seen from 01_CreateTables.sql) 
- Created a "Performance Analysis" (Seen from 02_View.sql)
- Created a Stored Procedure that returns a fighters profile (Seen from 03_Stored_Procedure.sql)
- Created a Trigger that catches data erros and sends them to an audit log (Seen from 04_Audit_Log.sql)

//How to use it:

EXEC sp_GetFighterProfile 'Islam Makhachev';

Output:
 
<img width="1115" height="850" alt="image" src="https://github.com/user-attachments/assets/99beb399-587e-4055-9654-c756de216ae7" />

