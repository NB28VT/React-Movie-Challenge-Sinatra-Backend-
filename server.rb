# TODO: move to gem file
# require "sinatra"
# require "curb"

get "/" do
  "It's alive!!!"
end

get "/movie_search" do
  # "https://api.themoviedb.org/3/search/movie?api_key=" + KeyConfig.TMDB_V3_KEY + "&query=" + encodeURI(this.props.searchValue);
end

get "/movie_data" do
  # "https://api.themoviedb.org/3/movie/" + movieData.id + "/credits?api_key=" + KeyConfig.TMDB_V3_KEY;
end


get "/movie_thumbnail" do
  # "https://image.tmdb.org/t/p/w500" +  this.props.movieData.poster_path + "?api_key=" + KeyConfig.TMDB_V3_KEY;
end


get "/cast_thumbnail" do
  # thumbnailUrl = "https://image.tmdb.org/t/p/w500" +  this.props.castMember.profile_path + "?api_key=" + KeyConfig.TMDB_V3_KEY;
end
