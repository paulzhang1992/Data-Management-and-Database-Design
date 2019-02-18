import tweepy


class Authentication:

    def __init__(self):
        # __consumer_key,__consumer_secret,__access_token,__access_token_secret
        '''
        self.__consumer_key
        self.__consumer_secret
        self.__access_token
        self.__access_token_secret
        '''
        self.__consumer_key = "Dfkc5gnZ2QlIEXaFSBbO5xgo3"
        self.__consumer_secret = "hC2NRpeDvu7Bba9HbouSvjJ3CTTBaqbmkgJzV809eZbQ9mNb97"
        self.__access_token = "1093886590647181312-0XeaWQA2aESHe1vDdp8otMK2JYHSVD"
        self.__access_token_secret = "6ciJ252LAKTm4XXS4pBLFrPxVHKPF3B73yhaaUR2edAok"

    def get_consumer_key(self):
        return self.__consumer_key

    def get_consumer_secret(self):
        return self.__consumer_secret

    def get_access_key(self):
        return self.__access_token

    def get_access_secret(self):
        return self.__access_token_secret

    def load_api(self):
        auth = tweepy.OAuthHandler(self.__consumer_key, self.__consumer_secret)
        auth.set_access_token(self.__access_token, self.__access_token_secret)
        return tweepy.API(auth)

