-- 15 tweets are not imported during the process
-- This makes the 1 to many relationship between tweets and hashtags had issues

-- Create view in case original data modified accidentally
CREATE OR REPLACE VIEW temp AS select * from hashtags;

-- Remove duplicated tweetID and keep the entry with smallest ID
DELETE temp
    FROM temp LEFT JOIN
      -- Select what to keep
      (SELECT min(ID) AS id
          FROM temp
          GROUP BY TWEET_ID
         ) tokeep
         ON temp.ID = tokeep.id
    WHERE tokeep.id IS NULL;

-- Find tweets that had error when importing with its tweetID not in hashtags.Tweet_ID
CREATE OR REPLACE VIEW tweet_null AS SELECT * FROM temp
WHERE temp.TWEET_ID NOT IN (SELECT tweets.TWEET_ID FROM tweets)

-- Since temp and tweet_null are all created based on hasntags, DELETE is not adoptable. Creating a new view with the duplicated entity hashtags_1..
CREATE OR REPLACE VIEW temp2 AS select * from hashtags_1;

-- Remove Duplicated tweet id
DELETE temp2
    FROM temp2 LEFT JOIN
         (SELECT min(ID) AS id
          FROM temp2
          GROUP BY TWEET_ID
         ) tokeep
         ON temp2.ID = tokeep.id
    WHERE tokeep.id IS NULL;
-- Remove non exist tweet id in tweets and check if the amount is correct.
-- !!remember to re create temp 2 and re do this step before exporting because only one hashtag is kept.
DELETE temp2
    FROM temp2
    WHERE temp2.TWEET_ID in (SELECT TWEET_ID from tweet_null);

SELECT COUNT(*) FROM temp2;
SELECT COUNT(*) FROM hashtags;
-- 179756 - 179771 = -15 matches the errors we had



