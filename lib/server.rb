require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	def add_restaurants
		fisher     = Takeaway.new('Fishers'   ,'+44156982992', [Dish.new('Scampi',8.5),        Dish.new('Coleslaw',2.5),Dish.new('Burger' , 4.5), Dish.new('Coke',  1.5), Dish.new('Banana Fritter',5.5)])
		gola       = Takeaway.new('Gola'      ,'+44563235789', [Dish.new('Rissotto',8.5),      Dish.new('Pizza'   ,9.5),Dish.new('Lassagna',4.5), Dish.new('Beer',  3.5), Dish.new('Tiramisu',   5.5)])
		local_hero = Takeaway.new('Local Hero','+44247753221', [Dish.new('Scrambled Eggs',8.5),Dish.new('BLT     ',4.5),Dish.new('Pancake' ,4.5), Dish.new('Coffee',2.5), Dish.new('Apple Pie'  ,5.5)])
		old_japan  = Takeaway.new('Milano'    ,'+64343674322', [Dish.new('Sushi',8.5),         Dish.new('Teriyaki',9.5),Dish.new('burger',  4.5), Dish.new('Sake',  4.5), Dish.new('Tea Truffel',5.5)])

		[fisher,gola,local_hero,old_japan]
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

  post '/menu' do

  	@dish = params[:dish]

  	#CLIENT.place_order(@dish,1)

  	redirect to '/menu'

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
