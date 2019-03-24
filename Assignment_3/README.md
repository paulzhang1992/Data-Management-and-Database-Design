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

### 2nd form of normalization
*Table 1: allstar_games*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

*Table 2:*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

*Table 3: draft_history:*
> There is no calculated value in this entity.\
> partial dependency exist for this entity.\
> Player name can be represent with player id, where all other information is depend on team id.
> All information can be fin from teams entity. Therefore drop column is enough for this case.
>```mysql-sql
>alter table draft_history drop column PLAYER_NAME;
>alter table draft_history drop column TEAM_CITY;
>alter table draft_history drop column TEAM_NAME;
>alter table draft_history drop column TEAM_ABBREVIATION;
>```
> After modification 2NF is satisfied.

*Table 4: game_by_team:*
> Some percentage fields are calculated value.
>```mysql-sql
>alter table games_by_teams drop column FG_PCT;
>alter table games_by_teams drop column FG3_PCT;
>alter table games_by_teams drop column FT_PCT;
>alter table games_by_teams drop column REB;
>alter table games_by_teams drop column PLUS_MINUS;
>```
> Team information such as abbreviation and name is depend on team ID.
>```mysql-sql
>alter table games_by_teams drop column TEAM_ABBREVIATION;
>alter table games_by_teams drop column TEAM_NAME;
>```
> After modification 2NF is satisfied.

*Table 5: hashtag:*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

*Table 6: player_id:*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

*Table 7: player_info:*
> There is no calculated value in this entity.\
> partial dependency exist for this entity.\
> Player name can be represent with player id.
>```mysql-sql
>alter table player_info drop column PLAYER_NAME;
>```
> After modification 2NF is satisfied.

*Table 8: player_regular_totalstats:*
> Drop team id and league id because it is not static for each player.\
>```mysql-sql
>alter table player_regular_totalstats drop column LEAGUE_ID;
>alter table player_regular_totalstats drop column TEAM_ID;
>```
> Some percentage fields are calculated value. Rebound can not be dropped because some player do't have DREB nor OREB.
>```mysql-sql
>alter table player_regular_totalstats drop column FG_PCT;
>alter table player_regular_totalstats drop column FG3_PCT;
>alter table player_regular_totalstats drop column FT_PCT;
>```
>No partial dependency for this entity.\
> After modification 2NF is satisfied.

*Table 9: teams:*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

*Table 10: tweets:*
> No calculated field for this entity.
> Account name and account type is depend on user id.
>```mysql-sql
>alter table tweets drop column USER_NAME;
>alter table tweets drop column TYPE;
>```
> After modification 2NF is satisfied.

*Table 11: twitter_account:*
> There is no calculated value in this entity.\
> partial dependency does not exist for this entity.\
> Therefor 2NF is satisfied.

### 3rd form of normalization
*Table 1: allstar_games*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 2:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 3: draft_history:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 4: game_by_team:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 5: hashtag:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 6: player_id:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 7: player_info:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 8: player_regular_totalstats:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 9: teams:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 10: tweets:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

*Table 11: twitter_account:*
> There is no transitive dependency with in this entity
> Therefor 3NF is satisfied.

### View for use cases
a. Find the most accurate three pointer shooter after 1995 where the person need has at least 100 attempts.<br/>
>```mysql-sql
>CREATE OR REPLACE VIEW top_10_f3pct AS
>       -- Find the most accurate three pointer shooter after 1995 where the person need has at least 100 attempts.
>SELECT FULL_NAME,
>       FG3M,
>       FG3A,
>       -- Three pointer percentage =  made/attempts
>       FG3M / FG3A F3PCT,
>       PTS
>FROM (SELECT pi1995.FULL_NAME,
>             prt.PLAYER_ID,
>             -- Game played
>             prt.GP,
>             -- Game Started
>             prt.GS,
>             -- Min played
>             prt.MIN,
>             -- Field goal made
>             prt.FGM,
>             -- Field goal attempt
>             prt.FGA,
>             -- Three pointer made
>             prt.FG3M,
>             -- Three pointer attempt
>             prt.FG3A,
>             -- Free throw made
>             prt.FTM,
>             -- Free throw attempt
>             prt.FTA,
>             -- Offensive rebound
>             prt.OREB,
>             -- Defensive rebound
>             prt.DREB,
>             -- Assist
>             prt.AST,
>             -- Block
>             prt.BLK,
>             -- Turn over
>             prt.TOV,
>             -- Personal foul
>             prt.PF,
>             -- Point
>             prt.PTS
>      FROM player_regular_totalstats prt
>                  INNER JOIN (SELECT pi.PLAYER_ID, pi.FULL_NAME, dh.SEASON
>                              FROM draft_history dh
>                                          LEFT OUTER JOIN player_id pi
>                                                          ON dh.PLAYER_ID = pi.PLAYER_ID
>                              WHERE dh.SEASON >= 1995) pi1995
>                             ON prt.PLAYER_ID = pi1995.PLAYER_ID) t
>WHERE FG3A >= 100
>ORDER BY F3PCT DESC;
>```
b. Find players had most all-star appearances.
>```mysql-sql
>CREATE OR REPLACE VIEW all_star_appearances AS
>  -- Most All-star appearances
>SELECT pi.FULL_NAME, allstar.*
>FROM player_id pi
>       Right OUTER JOIN
>     -- Selecting player who has been in all star game for more 10 times
>       (SELECT COUNT(*) appearances, PLAYER_ID
>        FROM allstar_roaster
>        GROUP BY PLAYER_ID
>        HAVING COUNT(*) >= 10) allstar
>     On pi.PLAYER_ID = allstar.PLAYER_ID
>ORDER BY allstar.appearances DESC;
>```
c. Find team with most wins since 1983
>Some fields are dropped during the normalization. Few changes need be done for this use case.
>```mysql-sql
>CREATE OR REPLACE VIEW win_post_1983 AS
>  -- Team with most wins
>SELECT teams.FULL_NAME, win.*
>FROM teams
>       RIGHT JOIN (SELECT COUNT(*)              WINS,
>                          SUM(PTS)              TotalPTS,
>                          SUM(OREB) + SUM(DREB) TotalREB,
>                          SUM(AST)              TotalAST,
>                          SUM(STL)              TotalSTL,
>                          SUM(BLK)              TotalBLK,
>                          SUM(TOV)              TotalTOV,
>                          MIN(GAME_DATE)        Since,
>                          TEAM_ID
>                   FROM games_by_teams gt
>                   WHERE WL = "W"
>                   GROUP BY TEAM_ID, WL
>                   ORDER BY WINS Desc) win ON teams.ID = win.TEAM_ID;
>```
d. Find the most active player on twitter with their popularity

>```mysql-sql
>CREATE OR REPLACE VIEW player_tweets_popularity AS
>  -- Present with likes/tweet
>SELECT twitter_accounts.FULL_NAME, likes.*
>FROM twitter_accounts
>       LEFT JOIN (SELECT USER_ID,
>                         COUNT(*)                       AS Total_TWEET,
>                         SUM(FAVORITE_COUNT)            AS Total_FAV,
>                         SUM(FAVORITE_COUNT) / COUNT(*) AS FAVORITE_PER_TWEET
>                  FROM tweets
>                  GROUP BY USER_ID
>                  ORDER BY FAVORITE_PER_TWEET DESC) likes ON twitter_accounts.USER_ID = likes.USER_ID
>WHERE ACCOUNT_TYPE = 'player';
>```
e. Find what hashtag each nba player uses most frequently.
>```mysql-sql
>CREATE OR REPLACE VIEW hashtag_frequency AS
>SELECT HASHTAG, temp.USER_NAME, MAX(temp.TYPE) TYPE, COUNT(*) times
>FROM hashtags
>            LEFT JOIN (SELECT tweets.*, twitter_accounts.FULL_NAME AS USER_NAME, twitter_accounts.ACCOUNT_TYPE AS TYPE
>                       FROM tweets
>                                   LEFT JOIN twitter_accounts ON tweets.USER_ID = twitter_accounts.USER_ID) temp
>                      on hashtags.TWEET_ID = temp.TWEET_ID
>GROUP BY HASHTAG, USER_NAME;
>```
>```mysql-sql
>CREATE OR REPLACE VIEW player_hashtag_popularity AS
>  -- Show max frequency of hashtags for each player
>SELECT maxfre.USER_NAME, hf.HASHTAG, maxfre.times
>FROM hashtag_frequency hf
>       INNER JOIN (
>  -- Find max appearance for each player
>  SELECT USER_NAME, MAX(times) times FROM hashtag_frequency hf WHERE TYPE = 'player' GROUP BY USER_NAME) maxfre
>                  ON (hf.times = maxfre.times AND hf.USER_NAME = maxfre.USER_NAME)
>ORDER BY hf.times DESC;
>```

### Index
##### Use case 1 
Original performance: 
>completed in 489 ms

Now create index on player id for the join process
```mysql-sql
CREATE INDEX idx_player_id_PLAYER_ID ON player_id(PLAYER_ID);
CREATE INDEX idx_draft_history_PLAYER_ID ON draft_history(PLAYER_ID);
```
Performance:
>completed in 145 ms
##### Use case 2
Original performance: 
>completed in 197 ms

Now create index on player id for the join process
```mysql-sql
CREATE INDEX idx_allstar_PLAYER_ID ON allstar_roaster(PLAYER_ID);
```
Performance:
>completed in 142 ms
##### Use case 3
Original performance: 
>completed in 186 ms

Now create index on player id for the join process
```mysql-sql
CREATE INDEX idx_games_by_teams_TEAM_ID ON games_by_teams(TEAM_ID);
CREATE INDEX idx_games_by_teams_WL ON games_by_teams(WL);
```
Performance:
>completed in 150 ms
##### Use case 4
Original performance: 
>completed in 152 ms

Now create index on player id for the join process
```mysql-sql
CREATE INDEX idx_tweets_USER_ID ON tweets(USER_ID);
CREATE INDEX idx_twitter_accounts_USER_ID ON twitter_accounts(USER_ID);
```
Performance:
>completed in 150 ms
##### Use case 5
Original performance: 
>completed in 152 ms and 154ms

Now create index on player id for the join process
```mysql-sql
CREATE INDEX idx_hashtag_TWEET_ID ON hashtags(TWEET_ID);
CREATE INDEX idx_tweets_TWEET_ID ON tweets(TWEET_ID);
CREATE INDEX idx_twitter_accounts_TWEET_ID ON twitter_accounts(USER_ID);
```
Performance:
>completed in 142 ms and 144ms

### Functions
1. Find player's most frequent hashtag
```mysql-sql
DELIMITER $$

CREATE FUNCTION frequentHashtag(name TEXT)
RETURNS TEXT
BEGIN
  DECLARE hashtag TEXT;
  SELECT hf.HASHTAG INTO hashtag
  FROM hashtag_frequency hf
         INNER JOIN (
    -- Find max appearance for each player
    SELECT USER_NAME, MAX(times) times FROM hashtag_frequency hf WHERE USER_NAME = name GROUP BY USER_NAME) maxfre
                    ON (hf.times = maxfre.times AND hf.USER_NAME = maxfre.USER_NAME);
  RETURN hashtag;
end;

$$
DELIMITER ;

```
Test case:
```mysql-sql
SELECT frequentHashtag("Chris Paul");
```
Return:
>TeamCP3

1. Order the player most liked tweet

