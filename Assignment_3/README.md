#Assignment 3
## Abstract
This assignment mainly contains 4 parts. Firstly is perform database normalization. Normalization is performed with its 1NF, 2NF and 3NF.
After normalization, indexes are created for improve the performance of previously created use cases.
5 function and 5 procedures are also designed and created to fulfill the requirement of this assignment.
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
> Player name can be represent with player id.
>```mysql-sql
>alter table draft_history drop column PLAYER_NAME;
>```
> After modification 2NF is satisfied.

*Table 4: game_by_team:*
> Some percentage fields are calculated value.
>```mysql
>alter table games_by_teams drop column FG_PCT;
>alter table games_by_teams drop column FG3_PCT;
>alter table games_by_teams drop column FT_PCT;
>alter table games_by_teams drop column REB;
>alter table games_by_teams drop column PLUS_MINUS;
>```
> Team information such as abbreviation and name is depend on team ID.
>```mysql
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
>```mysql
>alter table player_info drop column PLAYER_NAME;
>```
> After modification 2NF is satisfied.

*Table 8: player_regular_totalstats:*
> Drop team id and league id because it is not static for each player.\
>```mysql
>alter table player_regular_totalstats drop column LEAGUE_ID;
>alter table player_regular_totalstats drop column TEAM_ID;
>```
> Some percentage fields are calculated value. Rebound can not be dropped because some player do't have DREB nor OREB.
>```mysql
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
>```mysql
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
> Team information is depend on the non-primary value team
>```mysql
>alter table draft_history drop column TEAM_CITY;
>alter table draft_history drop column TEAM_NAME;
>alter table draft_history drop column TEAM_ABBREVIATION;
>```
>Dropping the values are fine since they are also stored in teams entity.
After modifying, the entity is in 3NF.

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
>```mysql
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
>```mysql
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
>```mysql
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

>```mysql
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
>```mysql
>CREATE OR REPLACE VIEW hashtag_frequency AS
>SELECT HASHTAG, temp.USER_NAME, MAX(temp.TYPE) TYPE, COUNT(*) times
>FROM hashtags
>            LEFT JOIN (SELECT tweets.*, twitter_accounts.FULL_NAME AS USER_NAME, twitter_accounts.ACCOUNT_TYPE AS TYPE
>                       FROM tweets
>                                   LEFT JOIN twitter_accounts ON tweets.USER_ID = twitter_accounts.USER_ID) temp
>                      on hashtags.TWEET_ID = temp.TWEET_ID
>GROUP BY HASHTAG, USER_NAME;
>```
>```mysql
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
```mysql
CREATE INDEX idx_player_id_PLAYER_ID ON player_id(PLAYER_ID);
CREATE INDEX idx_draft_history_PLAYER_ID ON draft_history(PLAYER_ID);
```
Performance:
>completed in 145 ms
##### Use case 2
Original performance: 
>completed in 197 ms

Now create index on player id for the join process
```mysql
CREATE INDEX idx_allstar_PLAYER_ID ON allstar_roaster(PLAYER_ID);
```
Performance:
>completed in 142 ms
##### Use case 3
Original performance: 
>completed in 186 ms

Now create index on player id for the join process
```mysql
CREATE INDEX idx_games_by_teams_TEAM_ID ON games_by_teams(TEAM_ID);
CREATE INDEX idx_games_by_teams_WL ON games_by_teams(WL);
```
Performance:
>completed in 150 ms
##### Use case 4
Original performance: 
>completed in 152 ms

Now create index on player id for the join process
```mysql
CREATE INDEX idx_tweets_USER_ID ON tweets(USER_ID);
CREATE INDEX idx_twitter_accounts_USER_ID ON twitter_accounts(USER_ID);
```
Performance:
>completed in 150 ms
##### Use case 5
Original performance: 
>completed in 152 ms and 154ms

Now create index on player id for the join process
```mysql
CREATE INDEX idx_hashtag_TWEET_ID ON hashtags(TWEET_ID);
CREATE INDEX idx_tweets_TWEET_ID ON tweets(TWEET_ID);
CREATE INDEX idx_twitter_accounts_TWEET_ID ON twitter_accounts(USER_ID);
```

Performance:
>completed in 142 ms and 144ms

### Functions
1. Find player's most frequent hashtag
```mysql
DELIMITER //
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
//
DELIMITER ;
```
Test case:
```mysql
SELECT frequentHashtag("Chris Paul");
```
Return:
>TeamCP3

2. Get one player's most liked tweet
```mysql
DELIMITER //
CREATE FUNCTION popularTweet(userName TEXT)
RETURNS TEXT
BEGIN
  DECLARE tweet_out TEXT;
  SELECT TWEET INTO tweet_out
  FROM (SELECT tweets.*,ta.FULL_NAME
        FROM tweets
               LEFT JOIN twitter_accounts ta on tweets.USER_ID = ta.USER_ID
        WHERE ta.FULL_NAME = userName
        ORDER BY tweets.FAVORITE_COUNT DESC
        LIMIT 1) t;

  RETURN tweet_out;
END
//
DELIMITER ;
```
Test case:
```mysql
SELECT popularTweet("Chris Paul");
```
Return:

|   popularTweet("Chris Paul")                                                                |
|:------------------------------------------------------------------------------------------|
| And I doubt he's man enough to call any of those players a son of a bitch to their face... |

3. Most scored player drafted on certain year
```mysql
DELIMITER //

CREATE FUNCTION bestScorerYear(draftYear INT)
RETURNS TEXT
BEGIN
  DECLARE playerName TEXT;
  SELECT FULL_NAME INTO playerName
  FROM (SELECT d.PLAYER_ID, d.SEASON, p.PTS
        FROM draft_history d
               LEFT JOIN player_regular_totalstats p ON d.PLAYER_ID = p.PLAYER_ID
        WHERE SEASON = draftYear
        ORDER BY PTS DESC
       ) t
         LEFT JOIN player_id ON t.PLAYER_ID = player_id.PLAYER_ID
  LIMIT 1;

  RETURN playerName;
END
//
DELIMITER ;
```
Test case:
```mysql
SELECT bestScorerYear(2003);
```
Return:

| bestScorerYear(2003) |
|----------------------|
| LeBron James         |

4. If a player is an all-star player
```mysql
DELIMITER //

CREATE FUNCTION beenAnAllstar(playerName Text)
RETURNS BOOLEAN
BEGIN
  DECLARE allstarStatus INT;
  SELECT COUNT(*) INTO allstarStatus
  FROM (SELECT a.PLAYER_ID, COUNT(*), p.FULL_NAME
        FROM allstar_roaster a
               LEFT JOIN player_id p
                         ON a.PLAYER_ID = p.PLAYER_ID
        GROUP BY PLAYER_ID) t
  WHERE t.FULL_NAME = playerName;

-- null means no appearance, elseif for all star players, else statement is for 
    -- non NBA players
  IF allstarStatus IS NULL THEN RETURN FALSE;
  ELSEIF allstarStatus > 0 THEN RETURN TRUE;
  ELSE RETURN FALSE;
  END IF;

END;
//
DELIMITER ;
```
Test case 1:
```mysql
SELECT beenAnAllstar("Chris Paul");
```
Return:

| beenAnAllstar("Chris Paul") |
|:---------------------------:|
|                           1 |

Test case 2:
```mysql
-- Non NBA player for testing
SELECT beenAnAllstar("sad");
```
Return:
| beenAnAllstar("sad") |
|:--------------------:|
|                    0 |
5. Get likes/tweet for user to see their popularity
```mysql
DELIMITER //

CREATE FUNCTION favPerTweet(userName Text)
RETURNS DOUBLE
BEGIN
  DECLARE likesPerTweet DOUBLE;
  SELECT likes.FAVORITE_PER_TWEET INTO likesPerTweet
  FROM twitter_accounts
         LEFT JOIN (SELECT USER_ID, SUM(FAVORITE_COUNT) / COUNT(*) AS FAVORITE_PER_TWEET
                    FROM tweets
                    GROUP BY USER_ID
                    ORDER BY FAVORITE_PER_TWEET DESC) likes ON twitter_accounts.USER_ID = likes.USER_ID
  WHERE (ACCOUNT_TYPE = 'player' AND twitter_accounts.FULL_NAME = userName);
  IF userName IN (SELECT FULL_NAME FROM twitter_accounts) THEN
    RETURN likesPerTweet;
  ELSE
    RETURN 0;
  END IF;

END;
//
DELIMITER ;
```
Test case 1:
```mysql
SELECT favPerTweet("Stephen Curry");
```
Return:

| favPerTweet("Stephen Curry") |
|:----------------------------:|
|                    4726.6536 |

Test case 2:
```mysql
-- Non NBA player
SELECT favPerTweet("Who knows this is?");
```
Return:
| favPerTweet("Who knows this is?") |
|:---------------------------------:|
|                                 0 |

### Procedures
1. Show general information about database
```mysql
DELIMITER //
CREATE PROCEDURE explainDatabase()
BEGIN
  SHOW DATABASES;

  SHOW TABLES;
  
  SELECT i.TABLE_NAME, i.COLUMN_NAME, i.IS_NULLABLE, i.DATA_TYPE, i.PRIVILEGES
  FROM information_schema.columns i
  WHERE table_schema = 'nba';
  
END;//
DELIMITER ;
```
Test case:
```mysql
CALL explainDatabase();
```
Return:

| Database           |
|--------------------|
| information_schema |
| mysql              |
| nba                |
| performance_schema |
| sys                |
5 rows in set (0.06 sec)

| Tables_in_nba             |
|---------------------------|
| all_star_appearances      |
| all_star_apperances       |
| allstar_games             |
| allstar_roaster           |
| draft_history             |
| games_by_teams            |
| hashtag_frequency         |
| hashtags                  |
| player_hashtag_popularity |
| player_id                 |
| player_info               |
| player_regular_totalstats |
| player_tweets_popularity  |
| stats_post_1995           |
| teams                     |
| top_10_f3pct              |
| tweets                    |
| twitter_accounts          |
| win_post_1983             |
19 rows in set (0.06 sec)

| TABLE_NAME                | COLUMN_NAME        | IS_NULLABLE | DATA_TYPE | PRIVILEGES                      |
|---------------------------|--------------------|-------------|-----------|---------------------------------|
| all_star_appearances      | FULL_NAME          | YES         | text      | select,insert,update,references |
| all_star_appearances      | appearances        | NO          | bigint    | select,insert,update,references |
| all_star_appearances      | PLAYER_ID          | NO          | int       | select,insert,update,references |
| all_star_apperances       | FULL_NAME          | YES         | text      | select,insert,update,references |
| all_star_apperances       | appearances        | NO          | bigint    | select,insert,update,references |
| all_star_apperances       | PLAYER_ID          | NO          | int       | select,insert,update,references |
| allstar_games             | GAME_ID            | NO          | int       | select,insert,update,references |
| allstar_games             | DATE               | YES         | date      | select,insert,update,references |
| allstar_games             | WINNING_TEAM       | YES         | text      | select,insert,update,references |
| allstar_games             | WINNING_SCORE      | YES         | int       | select,insert,update,references |
| allstar_games             | LOSING_TEAM        | YES         | text      | select,insert,update,references |
| allstar_games             | LOSING_SCORE       | YES         | int       | select,insert,update,references |
| allstar_roaster           | STATUS             | YES         | varchar   | select,insert,update,references |
| allstar_roaster           | FGM                | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | FGA                | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | FG3M               | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | FG3A               | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | FTM                | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | FTA                | YES         | longtext  | select,insert,update,references |
| allstar_roaster           | OREB               | YES         | int       | select,insert,update,references |
| allstar_roaster           | DREB               | YES         | int       | select,insert,update,references |
| allstar_roaster           | AST                | YES         | int       | select,insert,update,references |
| allstar_roaster           | PF                 | YES         | int       | select,insert,update,references |
| allstar_roaster           | STL                | YES         | int       | select,insert,update,references |
| allstar_roaster           | TOV                | YES         | int       | select,insert,update,references |
| allstar_roaster           | BLK                | YES         | int       | select,insert,update,references |
| allstar_roaster           | PTS                | YES         | int       | select,insert,update,references |
| allstar_roaster           | GAME_ID            | NO          | int       | select,insert,update,references |
| allstar_roaster           | PLAYER_ID          | NO          | int       | select,insert,update,references |
| draft_history             | DRAFT_ID           | NO          | int       | select,insert,update,references |
| draft_history             | PLAYER_ID          | NO          | int       | select,insert,update,references |
| draft_history             | SEASON             | YES         | int       | select,insert,update,references |
| draft_history             | ROUND_NUMBER       | YES         | int       | select,insert,update,references |
| draft_history             | ROUND_PICK         | YES         | int       | select,insert,update,references |
| draft_history             | OVERALL_PICK       | YES         | int       | select,insert,update,references |
| draft_history             | TEAM_ID            | NO          | int       | select,insert,update,references |
| draft_history             | ORGANIZATION       | YES         | text      | select,insert,update,references |
| games_by_teams            | SEASON_ID          | YES         | int       | select,insert,update,references |
| games_by_teams            | TEAM_ID            | NO          | int       | select,insert,update,references |
| games_by_teams            | GAME_ID            | NO          | int       | select,insert,update,references |
| games_by_teams            | GAME_DATE          | YES         | date      | select,insert,update,references |
| games_by_teams            | MATCHUP            | YES         | text      | select,insert,update,references |
| games_by_teams            | WL                 | YES         | varchar   | select,insert,update,references |
| games_by_teams            | MIN                | YES         | int       | select,insert,update,references |
| games_by_teams            | PTS                | YES         | int       | select,insert,update,references |
| games_by_teams            | FGM                | YES         | int       | select,insert,update,references |
| games_by_teams            | FGA                | YES         | int       | select,insert,update,references |
| games_by_teams            | FG3M               | YES         | int       | select,insert,update,references |
| games_by_teams            | FG3A               | YES         | int       | select,insert,update,references |
| games_by_teams            | FTM                | YES         | int       | select,insert,update,references |
| games_by_teams            | FTA                | YES         | int       | select,insert,update,references |
| games_by_teams            | OREB               | YES         | int       | select,insert,update,references |
| games_by_teams            | DREB               | YES         | int       | select,insert,update,references |
| games_by_teams            | AST                | YES         | int       | select,insert,update,references |
| games_by_teams            | STL                | YES         | double    | select,insert,update,references |
| games_by_teams            | BLK                | YES         | int       | select,insert,update,references |
| games_by_teams            | TOV                | YES         | int       | select,insert,update,references |
| games_by_teams            | PF                 | YES         | int       | select,insert,update,references |
| hashtag_frequency         | HASHTAG            | YES         | varchar   | select,insert,update,references |
| hashtag_frequency         | USER_NAME          | YES         | varchar   | select,insert,update,references |
| hashtag_frequency         | TYPE               | YES         | text      | select,insert,update,references |
| hashtag_frequency         | times              | NO          | bigint    | select,insert,update,references |
| hashtags                  | ID                 | NO          | int       | select,insert,update,references |
| hashtags                  | TWEET_ID           | NO          | double    | select,insert,update,references |
| hashtags                  | HASHTAG            | YES         | varchar   | select,insert,update,references |
| player_hashtag_popularity | USER_NAME          | YES         | varchar   | select,insert,update,references |
| player_hashtag_popularity | HASHTAG            | YES         | varchar   | select,insert,update,references |
| player_hashtag_popularity | times              | YES         | bigint    | select,insert,update,references |
| player_id                 | FULL_NAME          | NO          | text      | select,insert,update,references |
| player_id                 | PLAYER_ID          | NO          | int       | select,insert,update,references |
| player_info               | RECORD_ID          | NO          | int       | select,insert,update,references |
| player_info               | YEAR_START         | YES         | int       | select,insert,update,references |
| player_info               | YEAR_END           | YES         | int       | select,insert,update,references |
| player_info               | POSITION           | YES         | text      | select,insert,update,references |
| player_info               | HEIGHT             | YES         | text      | select,insert,update,references |
| player_info               | WEIGHT             | YES         | int       | select,insert,update,references |
| player_info               | COLLEGE            | YES         | text      | select,insert,update,references |
| player_info               | PLAYER_ID          | YES         | int       | select,insert,update,references |
| player_regular_totalstats | STATS_ID           | NO          | int       | select,insert,update,references |
| player_regular_totalstats | PLAYER_ID          | NO          | int       | select,insert,update,references |
| player_regular_totalstats | GP                 | YES         | int       | select,insert,update,references |
| player_regular_totalstats | GS                 | YES         | int       | select,insert,update,references |
| player_regular_totalstats | MIN                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FGM                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FGA                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FG3M               | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FG3A               | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FTM                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | FTA                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | OREB               | YES         | int       | select,insert,update,references |
| player_regular_totalstats | DREB               | YES         | int       | select,insert,update,references |
| player_regular_totalstats | REB                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | AST                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | STL                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | BLK                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | TOV                | YES         | int       | select,insert,update,references |
| player_regular_totalstats | PF                 | YES         | int       | select,insert,update,references |
| player_regular_totalstats | PTS                | YES         | int       | select,insert,update,references |
| player_tweets_popularity  | FULL_NAME          | NO          | varchar   | select,insert,update,references |
| player_tweets_popularity  | USER_ID            | YES         | double    | select,insert,update,references |
| player_tweets_popularity  | Total_TWEET        | YES         | bigint    | select,insert,update,references |
| player_tweets_popularity  | Total_FAV          | YES         | decimal   | select,insert,update,references |
| player_tweets_popularity  | FAVORITE_PER_TWEET | YES         | decimal   | select,insert,update,references |
| stats_post_1995           | FULL_NAME          | YES         | text      | select,insert,update,references |
| stats_post_1995           | PLAYER_ID          | NO          | int       | select,insert,update,references |
| stats_post_1995           | GP                 | YES         | int       | select,insert,update,references |
| stats_post_1995           | GS                 | YES         | int       | select,insert,update,references |
| stats_post_1995           | MIN                | YES         | int       | select,insert,update,references |
| stats_post_1995           | FGM                | YES         | int       | select,insert,update,references |
| stats_post_1995           | FGA                | YES         | int       | select,insert,update,references |
| stats_post_1995           | FG3M               | YES         | int       | select,insert,update,references |
| stats_post_1995           | FG3A               | YES         | int       | select,insert,update,references |
| stats_post_1995           | FTM                | YES         | int       | select,insert,update,references |
| stats_post_1995           | FTA                | YES         | int       | select,insert,update,references |
| stats_post_1995           | OREB               | YES         | int       | select,insert,update,references |
| stats_post_1995           | DREB               | YES         | int       | select,insert,update,references |
| stats_post_1995           | AST                | YES         | int       | select,insert,update,references |
| stats_post_1995           | BLK                | YES         | int       | select,insert,update,references |
| stats_post_1995           | TOV                | YES         | int       | select,insert,update,references |
| stats_post_1995           | PF                 | YES         | int       | select,insert,update,references |
| stats_post_1995           | PTS                | YES         | int       | select,insert,update,references |
| teams                     | ABBREVIATION       | NO          | varchar   | select,insert,update,references |
| teams                     | CITY               | YES         | text      | select,insert,update,references |
| teams                     | FULL_NAME          | NO          | varchar   | select,insert,update,references |
| teams                     | ID                 | NO          | int       | select,insert,update,references |
| teams                     | NICKNAME           | YES         | text      | select,insert,update,references |
| teams                     | STATE              | YES         | text      | select,insert,update,references |
| teams                     | YEAR_FOUNDED       | YES         | int       | select,insert,update,references |
| top_10_f3pct              | FULL_NAME          | YES         | text      | select,insert,update,references |
| top_10_f3pct              | FG3M               | YES         | int       | select,insert,update,references |
| top_10_f3pct              | FG3A               | YES         | int       | select,insert,update,references |
| top_10_f3pct              | F3PCT              | YES         | decimal   | select,insert,update,references |
| top_10_f3pct              | PTS                | YES         | int       | select,insert,update,references |
| tweets                    | CREATED_AT         | YES         | text      | select,insert,update,references |
| tweets                    | TWEET_ID           | NO          | double    | select,insert,update,references |
| tweets                    | TWEET              | YES         | text      | select,insert,update,references |
| tweets                    | USER_ID            | NO          | double    | select,insert,update,references |
| tweets                    | RETWEET_COUNT      | YES         | int       | select,insert,update,references |
| tweets                    | FAVORITE_COUNT     | YES         | int       | select,insert,update,references |
| twitter_accounts          | FULL_NAME          | NO          | varchar   | select,insert,update,references |
| twitter_accounts          | TWITTER_ACC        | NO          | text      | select,insert,update,references |
| twitter_accounts          | ACCOUNT_TYPE       | YES         | text      | select,insert,update,references |
| twitter_accounts          | USER_ID            | NO          | double    | select,insert,update,references |
| win_post_1983             | FULL_NAME          | YES         | varchar   | select,insert,update,references |
| win_post_1983             | WINS               | NO          | bigint    | select,insert,update,references |
| win_post_1983             | TotalPTS           | YES         | decimal   | select,insert,update,references |
| win_post_1983             | TotalREB           | YES         | decimal   | select,insert,update,references |
| win_post_1983             | TotalAST           | YES         | decimal   | select,insert,update,references |
| win_post_1983             | TotalSTL           | YES         | double    | select,insert,update,references |
| win_post_1983             | TotalBLK           | YES         | decimal   | select,insert,update,references |
| win_post_1983             | TotalTOV           | YES         | decimal   | select,insert,update,references |
| win_post_1983             | Since              | YES         | date      | select,insert,update,references |
| win_post_1983             | TEAM_ID            | NO          | int       | select,insert,update,references |

153 rows in set (0.07 sec)

2. Show all the player stats with their name and som calculated value.
```mysql
DELIMITER //
CREATE PROCEDURE showStats(amount INT, orderWith TEXT)
BEGIN
  SET amount = IFNULL(amount,10);
  SELECT p.FULL_NAME               Name,
         -- s.FGM                     FGM,
         -- s.FGA                     FGA,
         ROUND(s.FGM / s.FGA, 2)   FGP,
         -- s.FG3M                    FG3M,
         -- s.FG3A                    FG3A,
         ROUND(s.FG3M / s.FG3A, 2) FG3P,
         -- s.FTM                     FTM,
         -- s.FTA                     FTA,
         ROUND(s.FTM / s.FTA, 2)   FTP,
         s.AST                     Assist,
         s.BLK                     Block,
         s.OREB                    OREB,
         s.DREB                    DREB,
         s.REB                     Rebound,
         PTS                       Points
  FROM player_regular_totalstats s
         LEFT JOIN player_id p ON s.PLAYER_ID = p.PLAYER_ID
  ORDER BY CASE orderWith
             WHEN "REB" THEN Rebound
             WHEN "BLK" THEN Block
             WHEN "AST" THEN Assist
             ELSE Points END DESC
  LIMIT amount;
END;//
DELIMITER ;
```
Test case:
```mysql
CALL showStats(10,"BLK");
```
Return:

| Name                | FGP  | FG3P | FTP  | Assist | Block | OREB | DREB  | Rebound | Points |
|:--------------------|------|------|------|--------|-------|------|-------|---------|-------:|
| Hakeem Olajuwon     | 0.51 | 0.20 | 0.71 |   3058 |  3830 | 4034 |  9714 |   13748 |  26946 |
| Dikembe Mutombo     | 0.52 | 0.00 | 0.68 |   1240 |  3289 | 3808 |  8551 |   12359 |  11729 |
| Kareem Abdul-Jabbar | 0.56 | 0.06 | 0.72 |   5660 |  3189 | 2975 |  9394 |   17440 |  38387 |
| Mark Eaton          | 0.46 | 0.00 | 0.65 |    840 |  3064 | 1857 |  5082 |    6939 |   5216 |
| Tim Duncan          | 0.51 | 0.18 | 0.70 |   4225 |  3020 | 3859 | 11232 |   15091 |  26496 |
| David Robinson      | 0.52 | 0.25 | 0.74 |   2441 |  2954 | 3083 |  7414 |   10497 |  20790 |
| Patrick Ewing       | 0.50 | 0.15 | 0.74 |   2215 |  2894 | 2752 |  8855 |   11607 |  24815 |
| Shaquille O'Neal    | 0.58 | 0.05 | 0.53 |   3026 |  2732 | 4209 |  8890 |   13099 |  28596 |
| Tree Rollins        | 0.52 | 0.00 | 0.70 |    660 |  2542 | 2148 |  4602 |    6750 |   6249 |
| Robert Parish       | 0.54 | 0.00 | 0.72 |   2180 |  2361 | 4598 | 10117 |   14715 |  23334 |

3. Recalculate player favorite hashtags
```mysql
DELIMITER //
CREATE PROCEDURE hashtagPopularity()
BEGIN
  SELECT maxfre.USER_NAME, hf.HASHTAG, maxfre.times
  FROM (SELECT HASHTAG, temp.USER_NAME, MAX(temp.TYPE) TYPE, COUNT(*) times
        FROM hashtags
               LEFT JOIN (SELECT tweets.*,
                                 twitter_accounts.FULL_NAME    AS USER_NAME,
                                 twitter_accounts.ACCOUNT_TYPE AS TYPE
                          FROM tweets
                                 LEFT JOIN twitter_accounts ON tweets.USER_ID = twitter_accounts.USER_ID) temp
                         on hashtags.TWEET_ID = temp.TWEET_ID
        GROUP BY HASHTAG, USER_NAME) hf
         INNER JOIN (
    -- Find max appearance for each player
    SELECT USER_NAME, MAX(times) times FROM hashtag_frequency hf WHERE TYPE = 'player' GROUP BY USER_NAME) maxfre
                    ON (hf.times = maxfre.times AND hf.USER_NAME = maxfre.USER_NAME)
  ORDER BY hf.times DESC;
END;//

DELIMITER ;
```
Test case:
```mysql
CALL hashtagPopularity;
```
Return:

| USER_NAME             | HASHTAG            | times |
|:----------------------|--------------------|------:|
| Russell Westbrook     | whynot             |  2655 |
| Stephen Curry         | DubNation          |   816 |
| LeBron James          | Striveforgreatness |   786 |
| James Harden          | ThunderUp          |   564 |
| Luka Doncic           | halamadrid         |   507 |
| Jayson Tatum          | Duke               |   393 |
| Joel Embiid           | kubball            |   288 |
| Gordon Hayward        | improveeveryday    |   287 |
| Carmelo Anthony       | STAYME7O           |   270 |
| Paul George           | PacerNation        |   246 |
| Kevin Durant          | KDIV               |   181 |
| Derrick Rose          | OneLastDance       |   154 |
| Paul Pierce           | FitClub34          |   145 |
| Kyrie Irving          | UncleDrew          |   113 |
| Jaylen Brown          | pause              |   106 |
| Chris Paul            | TeamCP3            |    92 |
| Kobe Bryant           | MambaMentality     |    73 |
| Klay Thompson         | Dubnation          |    61 |
| Giannis Antetokounmpo | NBAVote            |    49 |
| Dwyane Wade           | TheReturn          |    34 |

4. Show popularity of all account in the database
```mysql
DELIMITER //
CREATE PROCEDURE showPopularUser()
BEGIN
  SELECT twitter_accounts.FULL_NAME, likes.FAVORITE_PER_TWEET, likes.Total_FAV
  FROM twitter_accounts
         LEFT JOIN (SELECT USER_ID,
                           COUNT(*)                       AS Total_TWEET,
                           SUM(FAVORITE_COUNT)            AS Total_FAV,
                           SUM(FAVORITE_COUNT) / COUNT(*) AS FAVORITE_PER_TWEET
                    FROM tweets
                    GROUP BY USER_ID
                    ORDER BY FAVORITE_PER_TWEET DESC) likes ON twitter_accounts.USER_ID = likes.USER_ID
  ORDER BY FAVORITE_PER_TWEET DESC;

END;//

DELIMITER ;
```
Test case:
```mysql
CALL showPopularUser();
```
Return:

| FULL_NAME                  | FAVORITE_PER_TWEET | Total_FAV |
|:---------------------------|--------------------|----------:|
| LeBron James               |         10965.6073 |  35210565 |
| Dwyane Wade                |          7542.4384 |    550598 |
| Kobe Bryant                |          7431.0733 |  12060632 |
| Stephen Curry              |          4726.6536 |  15323811 |
| Joel Embiid                |          3615.4334 |   9277202 |
| Derrick Rose               |          2992.6783 |   9609490 |
| NBA on ESPN                |          1814.6775 |   5874111 |
| Golden State Warriors      |          1673.6285 |   5429251 |
| Los Angeles Lakers         |          1528.8495 |   4968761 |
| Kevin Durant               |          1520.7773 |   4861925 |
| Klay Thompson              |          1446.5665 |    794165 |
| NBA on TNTVerified account |          1445.3867 |   4675826 |
| Giannis Antetokounmpo      |          1325.9045 |   1430651 |
| Boston Celtics             |          1175.5571 |   3766485 |
| Russell Westbrook          |          1162.9021 |   3755011 |
| Chris Paul                 |          1130.7235 |   3644322 |
| Oklahoma City Thunder      |           977.5701 |   3160484 |
| Paul Pierce                |           858.2502 |   1386074 |
| Philadelphia 76ers         |           836.6944 |   2699176 |
| San Antonio Spurs          |           796.7956 |   2584805 |
| James Harden               |           706.2837 |   2275646 |
| Luka Doncic                |           684.2783 |   2148634 |
| Houston Rockets            |           656.0720 |   2104679 |
| Toronto Raptors            |           646.0882 |   2073297 |
| Gordon Hayward             |           573.2431 |   1476101 |
| Paul George                |           539.3915 |   1694768 |
| Carmelo Anthony            |           507.9635 |   1433981 |
| Chicago Bulls              |           477.9640 |   1552427 |
| Miami Heat                 |           475.4335 |   1525666 |
| Kyrie Irving               |           471.5825 |   1496803 |
| Timberwolves               |           457.5392 |   1472361 |
| Dallas Mavericks           |           445.1079 |   1435473 |
| New York Knicks            |           436.8454 |   1415379 |
| Jaylen Brown               |           401.6098 |   1053021 |
| Jayson Tatum               |           392.0559 |   1226351 |
| Cleveland Cavaliers        |           343.7219 |   1113659 |
| Utah Jazz                  |           250.8259 |    808161 |
| Milwaukee Bucks            |           239.9268 |    777123 |
| Sacramento Kings           |           236.1617 |    762330 |
| Indiana Pacers             |           228.1043 |    736777 |
| Portland Trail Blazers     |           218.6403 |    705115 |
| Brooklyn Nets              |           209.8916 |    672073 |
| Phoenix Suns               |           208.0875 |    668377 |
| Denver Nuggets             |           189.1141 |    611784 |
| Los Angeles Clippers       |           171.1645 |    550294 |
| Atlanta Hawks              |           145.7205 |    472863 |
| ClutchFans                 |           122.2711 |    395547 |
| Washington Wizards         |           117.3920 |    379998 |
| Memphis Grizzlies          |           110.8890 |    355510 |
| Orlando Magic              |           102.5611 |    331375 |
| Detroit Pistons            |            98.0844 |    316028 |
| Charlotte Hornets          |            83.5071 |    270229 |
| New Orleans Pelicans       |            72.2758 |    231427 |
| Fastbreak Breakfast        |            14.4711 |     46351 |
| CBS Sports NBA             |            10.4846 |     34033 |
| The Step Back              |             4.2150 |     13682 |
| NBA UK Fans                |             1.9128 |      6144 |
| Cameron Tabatabaie         |             1.8285 |      5919 |
| FanSided NBA               |             1.3924 |      4499 |
| The Drop NBA               |             0.0558 |       181 |

5. Get player with twitter(in this database) general info
```mysql
DELIMITER //
CREATE PROCEDURE showplayerInfo()
BEGIN
  SELECT p.FULL_NAME, t.TWITTER_ACC, p.HEIGHT, p.WEIGHT, p.YEAR_END - p.YEAR_START AS Years, p.POSITION
  FROM twitter_accounts t
         INNER JOIN (SELECT player_info.*, player_id.FULL_NAME
                     FROM player_info
                            LEFT JOIN player_id ON player_info.PLAYER_ID = player_id.PLAYER_ID) p ON
    t.FULL_NAME = p.FULL_NAME
  WHERE t.ACCOUNT_TYPE = 'player';

END;//

DELIMITER ;
```
Test case:
```mysql
CALL showplayerInfo();
```
Return:

| FULL_NAME         | TWITTER_ACC    | HEIGHT | WEIGHT | Years | POSITION |
|:------------------|----------------|--------|--------|-----------------|---------:|
| Carmelo Anthony   | carmeloanthony | 6-8    |    240 |              14 | F        |
| Jaylen Brown      | FCHWPO         | 6-7    |    225 |               1 | F-G      |
| Stephen Curry     | StephenCurry30 | 6-3    |    190 |               8 | G        |
| Kevin Durant      | KDTrey5        | 6-9    |    240 |              10 | F-G      |
| Joel Embiid       | JoelEmbiid     | 7-0    |    250 |               1 | C-F      |
| Paul George       | Yg_Trece       | 6-9    |    220 |               7 | F        |
| James Harden      | JHarden13      | 6-5    |    220 |               8 | G        |
| Gordon Hayward    | gordonhayward  | 6-8    |    226 |               7 | F-G      |
| Kyrie Irving      | KyrieIrving    | 6-3    |    193 |               6 | G        |
| Chris Paul        | CP3            | 6-0    |    175 |              12 | G        |
| Paul Pierce       | paulpierce34   | 6-7    |    235 |              18 | F-G      |
| Derrick Rose      | drose          | 6-3    |    190 |               9 | G        |
| Jayson Tatum      | jaytatum0      | 6-8    |    205 |               0 | F        |
| Klay Thompson     | KlayThompson   | 6-7    |    215 |               6 | G-F      |
| Dwyane Wade       | DwyaneWade     | 6-4    |    220 |              14 | G        |
| Russell Westbrook | russwest44     | 6-3    |    200 |               9 | G        |

## Contribution
This is an individual assignment all the work is done by me personally.
The works include normalize the database, create view for use case, create index to improve performance,
 create 5 functions and create 5 procedures.
 
## References
All the material used to lean normalization, index, function and procedure are provided by Prof. Brown.

Tutorial example by Prof.Brown: [Link](https://github.com/nikbearbrown/INFO_6210/blob/master/Assingments/INFO_6210_SP19_Assignment_3.pdf)<br/>
Last accessed on Mar.24.2019<br/>

## Licence 
# License
Copyright <2019> \<Zeyu Zhang>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 