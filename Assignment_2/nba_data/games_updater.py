import datetime
from nba_api.stats.endpoints import scoreboardv2
from nba_api.stats.endpoints import leaguegamefinder
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
        self.yesterday = datetime.datetime.now() - datetime.timedelta(1)
        self.game_date = str(self.yesterday.year) + "-" + str(self.yesterday.month) + "-" + str(self.yesterday.day)
        self.games = pd.DataFrame(columns=[])

    def gamefinder (self):
        score_board = scoreboardv2.ScoreboardV2(game_date=self.game_date)
        game_id = pd.DataFrame(score_board.get_data_frames()[0]).loc[:, "GAME_ID"]
        return game_id

    def gamestats (self, ids = pd.Series):
        for id in ids:
            box_score = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=id)
            team_stats = box_score.get_data_frames()[1]
            print(team_stats)
        return 0

    def playerstats (self, ids = pd.Series):
        for id in ids:
            box_score = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=id)
            players_stats = box_score.get_data_frames()[0]
            print(players_stats)
        return 0


def main():
    today_game = TeamStats()
    game_id = today_game.gamefinder()
    today_game.gamestats(game_id)
    return today_game


if __name__ == '__main__':
    test = main()


