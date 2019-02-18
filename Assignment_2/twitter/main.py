from auth import Authentication
from tweet_procress import TweetProcress
import pandas as pd

def team_tweet():
    tweets_team = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    nba_teams = api.list_members('NBA', 'nbateams',count=30)
    team_twitter = pd.DataFrame(columns=["ACCOUNT_ID", "TEAM", "TWITTER_ACC"])
    temp_team = team_twitter.copy()
    for member in nba_teams:
        temp_team.at[0, "ACCOUNT_ID"] = member.id
        temp_team.at[0, "TEAM"] = member.name
        temp_team.at[0, "TWITTER_ACC"] = member.screen_name
        team_twitter = team_twitter.append(temp_team)
    team_twitter = team_twitter.reset_index(drop=True)
    for i in range(0, team_twitter.shape[0]):
        account = team_twitter.at[i, "TWITTER_ACC"]
        team_tweet = TweetProcress.request_tweet(account, 200, 25)
        tweets_team = tweets_team.append(team_tweet)
        file = "Tweet "+team_twitter.at[i,"TEAM"]+".csv"
        team_tweet.to_csv("rawData//"+file, index=False)
        '''
        for j in range(5, 0, -1):
            time.sleep(1)
            print(str(j) + " seconds left for next run")
        '''
        print(file+" is done")
    tweets_team.to_csv("rawData//team//tweets_team.csv", index=False)


def player_tweet():
    tweets_player = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    temp_player = tweets_player.copy()



if __name__ == "__main__":

    auth = Authentication()
    api = Authentication.load_api(auth)
    # team_tweet()









