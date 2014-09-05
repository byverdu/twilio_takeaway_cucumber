require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	def add_restaurants
		fisher     = Takeaway.new('Fishers'   ,'+44156982992',[Dish.new('scampi',8.5),Dish.new('coleslaw',2.5),Dish.new('burger',4.5),Dish.new('coke',1.5),Dish.new('fish cake',5.5)])
		gola       = Takeaway.new('Gola'      ,'+44156982992',[Dish.new('local_hero',8.5),Dish.new('coleslaw',2.5),Dish.new('burger',4.5),Dish.new('coke',1.5),Dish.new('fish cake',5.5)])
		local_hero = Takeaway.new('Local Hero','+44156982992',[Dish.new('peror',8.5),Dish.new('coleslaw',2.5),Dish.new('burger',4.5),Dish.new('coke',1.5),Dish.new('fish cake',5.5)])
		milano     = Takeaway.new('Milano'    ,'+44156982992',[Dish.new('si',8.5),Dish.new('coleslaw',2.5),Dish.new('burger',4.5),Dish.new('coke',1.5),Dish.new('fish cake',5.5)])

		[fisher,gola,local_hero,milano]
	end

	set :views        , File.join(root, '..', "views")
	set :public_folder, File.join(root, '..', "public")
	
	enable :sessions

	CLIENT = User.new

  get '/' do
		erb :index
  end

  post '/' do

  	CLIENT.name    = params[:client]
  	CLIENT.number  = params[:telephone]

  	session['me'] = CLIENT.object_id

		redirect to '/menu'
  end

  get '/menu' do

  	@restaurants = add_restaurants

  	@client = CLIENT

  	erb :menu
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
