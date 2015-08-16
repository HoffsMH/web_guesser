require 'sinatra'
require 'sinatra/reloader'

erb :index, :locals => {:number => number}
num = 100
get '/' do
  erb :index
end

