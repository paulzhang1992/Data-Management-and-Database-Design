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
    temp = pd.DataFrame(columns=["TWEET_ID", "HASHTAG"])
    if pd.notna(current_row["HASHTAGS"]):
        hashtags = ast.literal_eval(current_row["HASHTAGS"])
        for hashtag in hashtags:
            temp.at[0, "TWEET_ID"] = current_row["TWEET_ID"]
            temp.at[0,"HASHTAG"] = hashtag

            dataframe = dataframe.append(temp)
    return dataframe


if __name__ == "__main__":
    '''
    tweets_team = pd.read_csv("team//tweets_team.csv")
    tweets_player = pd.read_csv("player//tweets_player.csv")
    tweets_fan = pd.read_csv("fan//tweets_fan.csv")
    tweets_team["TYPE"] = "team"
    tweets_player["TYPE"] = "player"
    tweets_fan["TYPE"] = "fan"
    tweet = tweets_team.append(tweets_player.append(tweets_fan))
    print(tweets_team.shape)
    tweet.to_csv("tweets.csv", index = False)
    '''
    j = 0
    hashtag_df = pd.read_csv("hashtags.csv")
    tweet = pd.read_csv("tweets.csv")

    for index, row in tweet.iterrows():
        #hashtag_df = pd.read_csv("hashtags.csv")
        current_row_hashtag = pd.DataFrame(columns=["TWEET_ID", "HASHTAG"])
        current_row_hashtag = (extract_hashtags(row, current_row_hashtag))
        hashtag_df = hashtag_df.append(current_row_hashtag)

        if j%50 == 0:
            print(j)
            print(tweet.shape[0])
        j += 1

        #hashtag_df.to_csv("hashtags.csv", index = False)
    hashtag_df = hashtag_df.reset_index(drop=True)
    hashtag_df.to_csv("hashtags.csv")
    print("Finished")