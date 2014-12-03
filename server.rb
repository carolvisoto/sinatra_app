require 'sinatra'
require 'soundcloud'

get '/' do
  erb :hello
end


get '/home/:name' do
  "Hello here is  #{params['name']}"
end  

get '/add/:a/:b' do |a, b|
  "#{a.to_i + b.to_i}"
end   

get '/tracks/:id' do
   client = SoundCloud.new(:client_id => '69e93cf2209402f6f3137a6452cf498f')
   @track = client.get("/tracks/#{params[:id]}")
    
    pic = @track.artwork_url
    if pic.nil?
      pic = @track.user[:avatar_url]    
    end
    @image ="#{pic}".sub("large", "crop")

   erb :tracks
end

get '/playlists/:id' do
   client = SoundCloud.new(:client_id => '69e93cf2209402f6f3137a6452cf498f')
   @playlist = client.get("/playlists/#{params[:id]}")

    pic = @playlist.artwork_url
    if pic.nil?
      pic = @playlist.user[:avatar_url]    
    end
    @image ="#{pic}".sub("large", "crop")
    
   erb :playlists
end
