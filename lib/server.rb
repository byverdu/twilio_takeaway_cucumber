require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	set :views, File.join(root, '..', "views")
	
	enable :sessions

	CLIENT = User.new()

  get '/' do

  	puts CLIENT

    erb :index
  end

  post '/' do




  	redirect to '/menu'
  end

  get '/menu' do

  	erb :menu
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
