#Assignment 3
### 1st form of normalization
*Table 1: allstar_games*
>Use explain and select * to see the general information of the entity
>```mysql
>EXPLAIN allstar_games;
>
>SELECT * FROM allstar_games LIMIT 10; 
>```
> Primary key is GAME_ID and there are no multiple value in single attribute.\
> Therefor 1NF is satisfied.

*Table 2:*
> After viewing the details, primary key is the combination of GAME_ID and PLAYER_ID.\
Multiple value are found in some field while FIC and REB are calculated value(This is for 2NF, spotting them is easy and save time when modify it together)
>```mysql
>CREATE TABLE allstar_roaster_temp AS
>  SELECT STATUS, POSITION,
>         SUBSTRING_INDEX(`FGM-A`, '-', 1) AS FGM,SUBSTRING_INDEX(`FGM-A`, '-', -1) AS FGA,
>         SUBSTRING_INDEX(`FG3M-A`, '-', 1) AS FG3M,SUBSTRING_INDEX(`FG3M-A`, '-', -1) AS FG3A,
>         SUBSTRING_INDEX(`FTM-A`, '-', 1) AS FTM,SUBSTRING_INDEX(`FTM-A`, '-', -1) AS FTA,
>         OREB,DREB,AST, PF, STL, TOV, BLK, PTS, GAME_ID,PLAYER_ID
>         FROM allstar_roaster;
>```
> Now drop the old table and rename the temp table after check the entity again.\
> After Modification, the table is 1NF 

*Table 3: draft_history:*
> After viewing the details, primary key is DRAFT_ID.\
> 1NF is satisfied.

*Table 4: game_by_team:*
> After viewing the details, primary key is the combination of GAME_ID and TEAM_ID.\
> 1NF is satisfied.

*Table 5: hashtag:*
> After viewing the details, primary key is ID.\
> 1NF is satisfied.

*Table 6: player_id:*
> After viewing the details, primary key is PLAYER_ID.\
> 1NF is satisfied.

*Table 7: player_info:*
> After viewing the details, primary key is RECORD_ID.\
> 1NF is satisfied.

*Table 8: player_regular_totalstats:*
> After viewing the details, primary key is STATS_ID.\
> 1NF is satisfied.

*Table 9: teams:*
> After viewing the details, primary key is ID.\
> 1NF is satisfied.

*Table 10: tweets:*
> After viewing the details, primary key is TWEET_ID.\
> 1NF is satisfied.

*Table 11: twitter_account:*
> After viewing the details, primary key is USER_ID.\
> 1NF is satisfied.