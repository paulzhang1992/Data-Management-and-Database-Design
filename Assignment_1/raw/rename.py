import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()

player_info=pd.read_csv(cwd+'/player_info.csv')

#player_info = player_info.drop(player_info.columns[0], axis=1)

print(player_info.columns)

player_info.columns = ['FULL_NAME','YEAR_START','YEAR_END',"POSITION",'HEIGHT','WEIGHT','BIRTH_DATE','COLLEGE']


#player_info = player_info.drop(player_info.columns[0], axis=1)
# csv file path
csv_path = cwd + '/player_info.csv'

# Save the allstar players
player_info.to_csv(csv_path)

print('File saved as', csv_path)