-- Use case 1

-- Create view of player enter the league after 1995. join with draft history and player id.

CREATE OR REPLACE VIEW stats_post_1995 AS
  SELECT
         pi1995.FULL_NAME,
         prt.PLAYER_ID,
         -- Game played
         prt.GP,
         -- Game Started
         prt.GS,
         -- Min played
         prt.MIN,
         -- Field goal made
         prt.FGM,
         -- Field goal attempt
         prt.FGA,
         -- Three pointer made
         prt.FG3M,
         -- Three pointer attempt
         prt.FG3A,
         -- Free throw made
         prt.FTM,
         -- Free throw attempt
         prt.FTA,
         -- Offensive rebound
         prt.OREB,
         -- Defensive rebound
         prt.DREB,
         -- Assist
         prt.AST,
         -- Block
         prt.BLK,
         -- Turn over
         prt.TOV,
         -- Personal foul
         prt.PF,
         -- Point
         prt.PTS
  FROM player_regular_totalstats prt
  INNER JOIN (SELECT pi.PLAYER_ID,pi.FULL_NAME,dh.SEASON FROM draft_history dh
      LEFT OUTER JOIN player_id pi
        ON dh.PLAYER_ID = pi.PLAYER_ID
      WHERE dh.SEASON >= 1995) pi1995
    ON prt.PLAYER_ID = pi1995.PLAYER_ID;

-- Find the most accurate three pointer shooter after 1995 where the person need has at least 100 attempts.

SELECT FULL_NAME, FG3M, FG3A,
       -- Three pointer percentage =  made/attempts
       FG3M/FG3A F3PCT,
       PTS FROM stats_post_1995
WHERE FG3A >= 100 ORDER BY F3PCT DESC LIMIT 10;


-- Use case 2
-- See how many tweets each player tweeted
SELECT USER_NAME,COUNT(*) FROM tweets WHERE TYPE='player'
GROUP BY USER_NAME ORDER BY COUNT(*) DESC LIMIT 10;


-- Count favorites each player get
SELECT USER_NAME,SUM(FAVORITE_COUNT) FROM tweets WHERE TYPE='player'
GROUP BY USER_NAME ORDER BY SUM(FAVORITE_COUNT) DESC LIMIT 10;


-- Present with likes/tweet
SELECT USER_NAME,COUNT(*),SUM(FAVORITE_COUNT),SUM(FAVORITE_COUNT)/COUNT(*) FAVORITE_PER_TWEET FROM tweets WHERE TYPE='player'
GROUP BY USER_NAME ORDER BY FAVORITE_PER_TWEET DESC LIMIT 10;


-- Use case 3
-- Create view for each hashtag frequency by username
CREATE OR REPLACE VIEW hashtag_frequency AS
SELECT HASHTAG,t.USER_NAME,MAX(t.TYPE) TYPE,COUNT(*) times  FROM hashtags
  LEFT JOIN tweets t on hashtags.TWEET_ID = t.TWEET_ID
GROUP BY HASHTAG,USER_NAME;

SELECT* FROM hashtag_frequency LIMIT 10;


-- Show max frequency of hashtags for each player
SELECT maxfre.USER_NAME,hf.HASHTAG, maxfre.times FROM hashtag_frequency hf
  INNER JOIN (
      -- Find max appearance for each player
      SELECT USER_NAME, MAX(times) times FROM hashtag_frequency hf WHERE TYPE = 'player'GROUP BY USER_NAME) maxfre
    ON (hf.times=maxfre.times AND hf.USER_NAME = maxfre.USER_NAME)
ORDER BY hf.times DESC;

