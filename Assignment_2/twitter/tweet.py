import tweepy
from auth import Authentication
import pandas as pd

'''
Info we are extracting from tweets
1. created_at        "created_at":"Wed Aug 27 13:08:45 +0000 2008" 
2. id                tweet id
3. text              tweet
4. user.id           user ID
5. user.name         user name
6. place.country     country "United States" (might be None)
    # might not include
7. reply_count       number of replies
8. retweet_count     number of retweets
9. favorite_count    number of likes
10.entities          dict including hashtags (.entities["hashtags"][0]["text"] for hashtags text)
'''


def tweet_extract (tweets):
    temp = pd.DataFrame
    temp.columns = ["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "REPLY_COUNT", "RETWEET_COUNT", "FAVORITE_COUNT", "HASHTAGS"]
    hashtags = []
    temp.iat[0, 0] = tweets.created_at
    temp.iat[0, 1] = tweets.id
    temp.iat[0, 2] = tweets.text
    temp.iat[0, 3] = tweets.user
    temp.iat[0, 4] = tweets.user
    temp.iat[0, 5] = tweets.reply_count
    temp.iat[0, 6] = tweets.retweet_count
    temp.iat[0, 7] = tweets.favorite_count
    hashtags.append(tweets.entities["hashtags"][0]["text"])
    temp.iat[0, 8] = hashtags
    return temp


if __name__ == "__main__":

    auth = Authentication()
    api = Authentication.load_api(auth)

    public_tweets = api.home_timeline()

    tweets_df = pd.DataFrame
    tweets_df.columns = ["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "REPLY_COUNT", "RETWEET_COUNT",
                    "FAVORITE_COUNT", "HASHTAGS"]


    for tweet in public_tweets:

        tweets_df.append(tweet_extract(tweet))
