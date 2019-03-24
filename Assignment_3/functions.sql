-- function 1
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


-- function 2
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


-- function 3
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




-- function 4
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



-- function 5
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


