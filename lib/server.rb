require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	def add_restaurants
		fisher     = Takeaway.new('Fishers'   ,'+44156982992')
		gola       = Takeaway.new('Gola'      ,'+44156982992')
		local_hero = Takeaway.new('Local Hero','+44156982992')
		milano     = Takeaway.new('Milano'    ,'+44156982992')

		[fisher,gola,local_hero,milano]
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

  	@restaurants = add_restaurants

  	 #CLIENT.name = session['me']


  	erb :menu
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
