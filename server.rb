require 'sinatra'
require 'soundcloud'

set :server, %w[thin webrick]

get '/' do
  'Hello world!'
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
   erb :tracks
end
