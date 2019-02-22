import pandas as pd
import ast

'''
To-Do:
1. Giving tweets ftom nba teams, players and fans a type attribute.
2. Combine 3 entities into tweets
3. Remove hashtags attribute from entity
4. Create new entity with 3 attributes: entry id, tweet id and hashtag. ( keep the duplicated hashtags appeared
    in one tweet for further uses.
'''


def extract_hashtags (current_row=pd.Series, dataframe=pd.DataFrame):
    # temp data frame
    temp = pd.DataFrame(columns=["TWEET_ID", "HASHTAG"])
    # Check if there is hashtags
    if pd.notna(current_row["HASHTAGS"]):
        # If true iterate the hashtags list converted with ast package
        hashtags = ast.literal_eval(current_row["HASHTAGS"])
        for hashtag in hashtags:
            temp.at[0, "TWEET_ID"] = current_row["TWEET_ID"]
            temp.at[0,"HASHTAG"] = hashtag
            dataframe = dataframe.append(temp)
    else :
        # If not write NO_HASHTAG along with tweet id
        temp.at[0, "TWEET_ID"] = current_row["TWEET_ID"]
        temp.at[0, "HASHTAG"] = "NO_HASHTAG" 
        dataframe = dataframe.append(temp)
    return dataframe


if __name__ == "__main__":
    # Load tweets from 3 files to dataframe
    tweets_team = pd.read_csv("team//tweets_team.csv")
    tweets_player = pd.read_csv("player//tweets_player.csv")
    tweets_fan = pd.read_csv("fan//tweets_fan.csv")
    # Assign each tweet a type of entries
    tweets_team["TYPE"] = "team"
    tweets_player["TYPE"] = "player"
    tweets_fan["TYPE"] = "fan"
    # Combine them into a single file
    tweet = tweets_team.append(tweets_player.append(tweets_fan))
    if tweets_team.shape[0] == tweets_team.shape[0]+tweets_player.shape[0]+tweets_fan.shape[0]
        print("success")
        tweet.to_csv("tweets.csv", index=False)
    else:print("Found missing values during the merge")

    # Start to extract hashtags to new single dataframe
    hashtag_df = pd.DataFrame(columns=["TWEET_ID", "HASHTAG"])
    # j for counting the progress
    j = 0
    for index, row in tweet.iterrows():
        # Data frame to store the value of current row
        current_row_hashtag = pd.DataFrame(columns=["TWEET_ID", "HASHTAG"])
        # Assign hashtags info
        current_row_hashtag = (extract_hashtags(row, current_row_hashtag))
        hashtag_df = hashtag_df.append(current_row_hashtag)

        if j%1000 == 0:
            print(j)
            print(tweet.shape[0])
        j += 1
    # Reset the index and adding it when saving file
    hashtag_df = hashtag_df.reset_index(drop=True)
    hashtag_df.to_csv("hashtags_null.csv")
    print("Finished")
