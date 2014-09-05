require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	def method_name
		
	end

	set :views, File.join(root, '..', "views")
	
	enable :sessions

	CLIENT = User.new

  get '/' do
		erb :index
  end

  post '/' do

  	CLIENT.name    = params[:client]
  	CLIENT.number  = params[:telephone]

  	session['me'] = CLIENT.object_id

  	puts session

		redirect to '/menu'
  end

  get '/menu' do


  	 #CLIENT.name = session['me']


  	erb :menu
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
