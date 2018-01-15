require 'dotenv/load'
require 'sinatra'
require 'net/http'
require 'pry'

configure :development do
  ALLOWED_ORIGIN = 'http://localhost:3000'
end


configure :production do
  ALLOWED_ORIGIN = 'https://whos-init.herokuapp.com'
end

before do
   content_type :json
   headers 'Access-Control-Allow-Origin' => ALLOWED_ORIGIN
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
