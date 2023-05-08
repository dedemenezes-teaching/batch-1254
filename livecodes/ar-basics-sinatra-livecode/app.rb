require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# ROUTER + CONTROLLER

# post -> send information to the serve        C
# get -> retrieve                              R
# patch -> update an information in the server U
# delete -> remove from the database           D
# RESTful pattern

# ROUTE is made of VERB + PATH
require 'pry-byebug'

get "/" do
  # 1. retrieve all the restaurants
  @restaurants = Restaurant.all
  # 2. Ask the view to display
  erb :index
end

get "/restaurants/:id" do
  # params[:id]
  # it will retrieve the value from the URL
  # 1. retrieve the right instance of the Restaurant class
  # 2. send them to the view to be displayed
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post '/restaurants' do
  # binding.pry
  # params #=> {"name"=>"Digglet", "address"=>"Cerulean", "rating"=>"3"}
  restaurant = Restaurant.create(name: params[:name], address: params[:address], rating: params[:rating])
  # USUALLY YOU DONT HAVE A VIEW FOR THEM!
  redirect "/restaurants/#{restaurant.id}"
end
