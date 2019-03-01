-- Add players not appeared in player id

-- Delete duplicated entries if there is any
DELETE player_info
    FROM player_info LEFT JOIN
         (SELECT min(RECORD_ID) AS id
          FROM player_info
          GROUP BY PLAYER_ID
         ) tokeep
         ON player_info.RECORD_ID = tokeep.id
    WHERE tokeep.id IS NULL;

-- Use join method to combine player info and player id. Players that are not in player id will have a null value in NAME.
-- Method an be optimized with not in which I found out later in the process.
-- Split name into first and last.
CREATE OR REPLACE VIEW player_null AS
  SELECT * FROM(
    SELECT SUBSTRING_INDEX(player_info.FULL_NAME, ' ', 1) AS FIRST_NAME,
           player_info.FULL_NAME,
           SUBSTRING_INDEX(player_info.FULL_NAME, ' ', -1) AS LAST_NAME,
           player_info.PLAYER_ID,player_id.FULL_NAME AS NAME
     FROM player_info
     LEFT JOIN player_id
       ON player_id.PLAYER_ID = player_info.PLAYER_ID) as temp
     WHERE temp.NAME IS NULL;

-- Re-modify the table for adding to the player id
CREATE OR REPLACE VIEW player_id_append AS
  SELECT FIRST_NAME,FULL_NAME,LAST_NAME,PLAYER_ID FROM player_null;

-- Add entries
INSERT INTO player_id (FIRST_NAME, FULL_NAME, LAST_NAME, PLAYER_ID)
SELECT * FROM player_id_append;

-- Clean the temporary view
Drop VIEW player_null, player_id_append;

-------------------------------------------------------------------------------------------------------
-- Add players from draft history who is not in player id.

-- Creat view for safety
CREATE OR REPLACE VIEW temp AS select * from draft_history;

-- Delete duplicated entries if there is any
DELETE temp
    FROM temp LEFT JOIN
         (SELECT min(DRAFT_ID) AS id
          FROM temp
          GROUP BY PLAYER_ID
         ) tokeep
         ON temp.DRAFT_ID = tokeep.id
    WHERE tokeep.id IS NULL;

-- Use join method to combine draft history and player id.Split name into first and last.
CREATE OR REPLACE VIEW player_null AS
  SELECT * FROM(
    SELECT SUBSTRING_INDEX(draft_history.PLAYER_NAME, ' ', 1) AS FIRST_NAME,
           draft_history.PLAYER_NAME,
           SUBSTRING_INDEX(draft_history.PLAYER_NAME, ' ', -1) AS LAST_NAME,
           draft_history.PLAYER_ID,player_id.FULL_NAME AS NAME
     FROM draft_history
     LEFT JOIN player_id
       ON player_id.PLAYER_ID = draft_history.PLAYER_ID) as temp
     WHERE temp.NAME IS NULL;

-- Re-modify the table for adding to the player id
CREATE OR REPLACE VIEW player_id_append AS
  SELECT FIRST_NAME,PLAYER_NAME AS FULL_NAME,LAST_NAME,PLAYER_ID FROM player_null;

-- Add entries
INSERT INTO player_id (FIRST_NAME, FULL_NAME, LAST_NAME, PLAYER_ID)
SELECT * FROM player_id_append;
-- Clean the temporary view
Drop VIEW player_null, player_id_append, temp;

-- check for duplicated id again to make sure
SELECT * FROM player_id
GROUP BY PLAYER_ID HAVING COUNT(*) > 1;