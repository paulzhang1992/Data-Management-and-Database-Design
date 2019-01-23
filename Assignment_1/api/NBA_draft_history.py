#get the data when players came into NBA
from nba_api.stats.endpoints import drafthistory
import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()


data_draft_history = drafthistory.DraftHistory().get_data_frames()[0]

data_draft_history.rename(columns={data_draft_history.columns[0]: 'PLAYER_ID'}, inplace=True)


# csv file path
csv_path = cwd + '/raw_data/player_draft_history.csv'

# Save the player id info
data_draft_history.to_csv(csv_path)

print('File saved as', csv_path)



