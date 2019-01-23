from nba_api.stats.endpoints import playercareerstats
import pandas as pd
import time
import os

# Get current working directory
cwd = os.getcwd()

# Select nba players info
nba_player_df = pd.read_csv(cwd + '/raw_data/player_id.csv')
#nba_player_df.head(10)

# Extract player id for requesting player stats
nba_player_id = nba_player_df ['PLAYER_ID']

# Request first record to initiate the player stat dataframe
player_regular_totalstats = playercareerstats.PlayerCareerStats(player_id = nba_player_id[0], per_mode36 = 'Totals').get_data_frames()[1]

# Set range to second to the number of rows
length = nba_player_id.shape[0]
for i in range(1,length):
    player_regular_totalstats = player_regular_totalstats.append(       # Update the dataframe after requested new data
        playercareerstats.PlayerCareerStats(player_id = nba_player_id[i], per_mode36 = 'Totals').get_data_frames()[1]
                                      , ignore_index=True)


    # Printing progress
    progress = i
    print('Progress ',progress, '/', length)

    # Rapid request without caused fail during test
    # Set 0.5 second of delay to prevent issues
    time.sleep(0.5)

player_regular_totalstats.columns = ['','PLAYER_ID', 'LEAGUE_ID', 'TEAM_ID', 'GP', 'GS', 'MIN', 'FGM', 'FGA', 'FG_PCT', 'FG3M', 'FG3A', 'FG3_PCT', 'FTM', 'FTA', 'FT_PCT', 'OREB', 'DREB', 'REB', 'AST', 'STL', 'BLK', 'TOV', 'PF', 'PTS']

# Set csv saving path
csv_path = cwd + '/raw_data/player_regular_totalstats.csv'

player_regular_totalstats.to_csv(csv_path)

print('File saved as', csv_path)