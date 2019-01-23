from nba_api.stats.static import players
import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()
# Retrieving nba players info
nba_player_list = players.get_players()
# ie {'id': 2544, 'full_name': 'LeBron James', 'first_name': 'LeBron', 'last_name': 'James'}

# Convert nba_players to pandas dataframe
nba_player_df = pd.DataFrame.from_dict(nba_player_list)

nba_player_df.columns = ['FIRST_NAME', 'FULL_NAME', 'PLAYER_ID', 'LAST_NAME']
# csv file path
csv_path = cwd + '/raw_data/player_id.csv'

# Save the player id info
nba_player_df.to_csv(csv_path)

print('File saved as', csv_path)