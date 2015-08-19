require 'sinatra'
require 'sinatra/reloader'
require './game.rb'

game = Game.new(3)
game.cheats = true


get '/' do
  game.guess(params['guess'])
  erb :index, :locals => {:message => game.message}
end

