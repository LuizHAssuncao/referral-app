class LeaderboardController < ApplicationController
  def index
    json_response(Contact.leaderboard)
  end
end
