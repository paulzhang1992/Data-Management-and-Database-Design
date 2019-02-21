DELETE player_info
    FROM player_info LEFT JOIN
         (SELECT min(RECORD_ID) AS id
          FROM player_info
          GROUP BY PLAYER_ID
         ) tokeep
         ON player_info.RECORD_ID = tokeep.id
    WHERE tokeep.id IS NULL;


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


CREATE OR REPLACE VIEW player_id_append AS
  SELECT FIRST_NAME,FULL_NAME,LAST_NAME,PLAYER_ID FROM player_null;

INSERT INTO player_id (FIRST_NAME, FULL_NAME, LAST_NAME, PLAYER_ID)
SELECT * FROM player_id_append;

Drop VIEW player_null, player_id_append;