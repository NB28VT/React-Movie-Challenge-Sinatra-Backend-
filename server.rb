require 'dotenv/load'
require 'sinatra'
require 'net/http'
require 'pry'

before do
   content_type :json
   # headers 'Access-Control-Allow-Origin' => '*'
   headers 'Access-Control-Allow-Origin' => 'https://whos-init.herokuapp.com'
   headers 'Access-Control-Allow-Origin' =>'http://localhost:3000'
   # Try without for now:
   # 'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

get "/movie_search" do
  uri = URI("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_V3_KEY']}&query=#{params[:query]}")
  Net::HTTP.get(uri)
end

get "/movie_data" do
  uri = URI("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/credits?api_key=#{ENV['TMDB_V3_KEY']}")
  Net::HTTP.get(uri)
end

get "/movie_thumbnail" do
  uri = URI("https://image.tmdb.org/t/p/w500/#{params[:poster_path]}.jpg?api_key=#{ENV['TMDB_V3_KEY']}")
  Net::HTTP.get(uri)
end

get "/cast_thumbnail" do
  uri = URI("https://image.tmdb.org/t/p/w500/#{params[:profile_picture_path]}.jpg?api_key=#{ENV['TMDB_V3_KEY']}")
  Net::HTTP.get(uri)
end
