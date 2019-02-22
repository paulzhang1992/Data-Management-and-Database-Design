-- a. What user posted this (e.g. tweet, facebook post, IG post, etc.)?
SELECT USER_NAME FROM tweets_team
  WHERE TWEET = "Clear the runway for @Double0AG 🛫 https://t.co/MRbdVVGFRi";

SELECT USER_NAME FROM tweets_team
  WHERE TWEET like "Clear the runway for %";
-- b. When did the user post this (e.g. tweet, facebook post, IG post, etc.)?
SELECT CREATED_AT FROM tweets_team
  WHERE TWEET like "Clear the runway for %";

SELECT YEAR(CREATED_AT),MONTH(CREATED_AT),DAY(CREATED_AT),HOUR(CREATED_AT),MINUTE(CREATED_AT), SECOND(CREATED_AT)
  FROM tweets_team
  WHERE TWEET like "Clear the runway for %";
-- c. What posts has this user posted in the past 24 hours?
SELECT CREATED_AT,TWEET,USER_NAME FROM tweets_team
  ORDER BY CREATED_AT DESC LIMIT 10;

SELECT CREATED_AT, TWEET, USER_NAME, RETWEET_COUNT, FAVORITE_COUNT, HASHTAGS
  FROM tweets_team
  /*
  2 constrains, less than 24 hours and from pelicans
  time >= latest time by pelicans
  SELECT DATE_SUB(latest time, 24 hours)
  latest time = SELECT MAX(CREATED_AT) FROM tweets_team
                  WHERE USER_NAME = "New Orleans Pelicans"
  */
  WHERE (CREATED_AT
            >= (SELECT DATE_SUB((
              SELECT MAX(CREATED_AT)
              FROM tweets_team
              WHERE USER_NAME = "New Orleans Pelicans")
              ,INTERVAL 24 HOUR))
           AND USER_NAME = "New Orleans Pelicans")
  ORDER BY CREATED_AT DESC;
-- d. How many post has this user posted in the past 24 hours?\
SELECT COUNT(*), USER_NAME
  FROM tweets_team
  WHERE (CREATED_AT
            >= (SELECT DATE_SUB((
              SELECT MAX(CREATED_AT)
              FROM tweets_team
              WHERE USER_NAME = "New Orleans Pelicans")
              ,INTERVAL 24 HOUR))
           AND USER_NAME = "New Orleans Pelicans")
  GROUP BY USER_NAME;
-- e. What keywords/ hashtags are popular?\
SELECT HASHTAGS, REGEXP_SUBSTR ( HASHTAGS,'\'(.*?)\'')
  FROM tweets_team limit 100;
-- f. What posts are popular?

