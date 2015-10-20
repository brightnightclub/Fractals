require 'sinatra'
require 'sinatra/reloader'
require './lib/fractal.rb'

get '/' do
  erb(:fractal)
end
