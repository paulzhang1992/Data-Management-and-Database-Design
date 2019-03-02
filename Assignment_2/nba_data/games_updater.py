import datetime
from nba_api.stats.endpoints import scoreboardv2
from nba_api.stats.endpoints import boxscoretraditionalv2
import pandas as pd


"""
Update database after each day:
    - NBA stats
    1. games_by_team                # Current goal
    2. game_details                 # New table
    3. player_total_stats           # To-Do
    - Twitter
    4. tweets                       # To-Do
    5. hashtags                     # To-Do With tweets
"""


class TeamStats:
    def __init__(self):
        self.date = datetime.datetime.now() - datetime.timedelta(1)

    def gamefinder (self):
        game_date = str(self.date.year) + "-" + str(self.date.month) + "-" + str(self.date.day)
        score_board = scoreboardv2.ScoreboardV2(game_date=game_date)
        game_id = pd.DataFrame(score_board.get_data_frames()[0]).loc[:, "GAME_ID"]
        return game_id

    def gamestats (self, ids = pd.Series):
        for id in ids:
            games = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=id)
            game_stats = games.get_data_frames()[0]
            print(game_stats)
        return 0


def main():
    today_game = TeamStats()
    print(today_game.date)
    game_id = today_game.gamefinder()
    print(game_id)
    today_game.gamestats(game_id)
    return today_game


if __name__ == '__main__':
    test = main()


