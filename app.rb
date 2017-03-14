require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require "uri"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = TeamData::ROLL_CALL
  erb :teams
end

get "/teams/:team" do
  # @names = params[:team_name]
  name = params[:team]
  @players = TeamData::ROLL_CALL[name.to_sym]
  # @teampage = TeamData::ROLL_CALL[:team_name]
  erb :teampage
end
