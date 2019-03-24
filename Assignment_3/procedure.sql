-- procedure 1

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



-- procedure 2
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




-- procedure 3
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





-- procedure 4
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






-- procedure 5
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