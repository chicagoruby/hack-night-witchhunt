# get '/games' do
#  erb '/games'
# end

get '/games/new' do
  if request.xhr?
    erb :"games/new", layout: false
  end
end

post '/games' do
  p "88" * 88
  p params
  "yay"
  @game = Game.create(player_count: params["player-count"])
  assign_roles(@game)
  if request.xhr?
    @players = @game.players.sort_by{|player| player.position}
    erb :"games/board", layout: false
  end
end