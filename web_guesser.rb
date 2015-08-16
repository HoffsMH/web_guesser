require 'sinatra'
require 'sinatra/reloader'
ran = Random.new
x = ran.rand(100)

get '/' do
  "The secret number is #{x}"
end

