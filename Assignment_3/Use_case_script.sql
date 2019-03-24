-- 1
CREATE OR REPLACE VIEW top_10_f3pct AS
       -- Find the most accurate three pointer shooter after 1995 where the person need has at least 100 attempts.
SELECT FULL_NAME,
       FG3M,
       FG3A,
       -- Three pointer percentage =  made/attempts
       FG3M / FG3A F3PCT,
       PTS
FROM (SELECT pi1995.FULL_NAME,
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
                  INNER JOIN (SELECT pi.PLAYER_ID, pi.FULL_NAME, dh.SEASON
                              FROM draft_history dh
                                          LEFT OUTER JOIN player_id pi
                                                          ON dh.PLAYER_ID = pi.PLAYER_ID
                              WHERE dh.SEASON >= 1995) pi1995
                             ON prt.PLAYER_ID = pi1995.PLAYER_ID) t
WHERE FG3A >= 100
ORDER BY F3PCT DESC;

-- 2
CREATE OR REPLACE VIEW all_star_appearances AS
  -- Most All-star appearances
SELECT pi.FULL_NAME, allstar.*
FROM player_id pi
       Right OUTER JOIN
     -- Selecting player who has been in all star game for more 10 times
       (SELECT COUNT(*) appearances, PLAYER_ID
        FROM allstar_roaster
        GROUP BY PLAYER_ID
        HAVING COUNT(*) >= 10) allstar
     On pi.PLAYER_ID = allstar.PLAYER_ID
ORDER BY allstar.appearances DESC;

-- 3
CREATE OR REPLACE VIEW win_post_1983 AS
  -- Team with most wins
SELECT teams.FULL_NAME, win.*
FROM teams
       RIGHT JOIN (SELECT COUNT(*)              WINS,
                          SUM(PTS)              TotalPTS,
                          SUM(OREB) + SUM(DREB) TotalREB,
                          SUM(AST)              TotalAST,
                          SUM(STL)              TotalSTL,
                          SUM(BLK)              TotalBLK,
                          SUM(TOV)              TotalTOV,
                          MIN(GAME_DATE)        Since,
                          TEAM_ID
                   FROM games_by_teams gt
                   WHERE WL = "W"
                   GROUP BY TEAM_ID, WL
                   ORDER BY WINS Desc) win ON teams.ID = win.TEAM_ID;


-- 4
CREATE OR REPLACE VIEW player_tweets_popularity AS
  -- Present with likes/tweet
SELECT twitter_accounts.FULL_NAME, likes.*
FROM twitter_accounts
       LEFT JOIN (SELECT USER_ID,
                         COUNT(*)                       AS Total_TWEET,
                         SUM(FAVORITE_COUNT)            AS Total_FAV,
                         SUM(FAVORITE_COUNT) / COUNT(*) AS FAVORITE_PER_TWEET
                  FROM tweets
                  GROUP BY USER_ID
                  ORDER BY FAVORITE_PER_TWEET DESC) likes ON twitter_accounts.USER_ID = likes.USER_ID
WHERE ACCOUNT_TYPE = 'player';


-- 5
CREATE OR REPLACE VIEW hashtag_frequency AS
SELECT HASHTAG, temp.USER_NAME, MAX(temp.TYPE) TYPE, COUNT(*) times
FROM hashtags
            LEFT JOIN (SELECT tweets.*, twitter_accounts.FULL_NAME AS USER_NAME, twitter_accounts.ACCOUNT_TYPE AS TYPE
                       FROM tweets
                                   LEFT JOIN twitter_accounts ON tweets.USER_ID = twitter_accounts.USER_ID) temp
                      on hashtags.TWEET_ID = temp.TWEET_ID
GROUP BY HASHTAG, USER_NAME;

CREATE OR REPLACE VIEW player_hashtag_popularity AS
  -- Show max frequency of hashtags for each player
SELECT maxfre.USER_NAME, hf.HASHTAG, maxfre.times
FROM hashtag_frequency hf
       INNER JOIN (
  -- Find max appearance for each player
  SELECT USER_NAME, MAX(times) times FROM hashtag_frequency hf WHERE TYPE = 'player' GROUP BY USER_NAME) maxfre
                  ON (hf.times = maxfre.times AND hf.USER_NAME = maxfre.USER_NAME)
ORDER BY hf.times DESC;

