require 'sinatra/base'
require './lib/loader'

class TwilioTakeaway < Sinatra::Base

	def add_restaurants
		fisher     = Takeaway.new('Fishers'   ,'+44156982992', [Dish.new('Scampi',8.5,0),        Dish.new('Coleslaw',2.5,0),Dish.new('Burger' , 4.5,0), Dish.new('Coke',  1.5,0), Dish.new('Banana Fritter',5.5,0)])
		gola       = Takeaway.new('Gola'      ,'+44563235789', [Dish.new('Rissotto',8.5,0),      Dish.new('Pizza'   ,9.5,0),Dish.new('Lassagna',4.5,0), Dish.new('Beer',  3.5,0), Dish.new('Tiramisu',   5.5,0)])
		local_hero = Takeaway.new('Local Hero','+44247753221', [Dish.new('Scrambled Eggs',8.5,0),Dish.new('BLT     ',4.5,0),Dish.new('Pancake' ,4.5,0), Dish.new('Coffee',2.5,0), Dish.new('Apple Pie'  ,5.5,0)])
		old_japan  = Takeaway.new('Milano'    ,'+64343674322', [Dish.new('Sushi',8.5,0),         Dish.new('Teriyaki',9.5,0),Dish.new('burger',  4.5,0), Dish.new('Sake',  4.5,0), Dish.new('Tea Truffel',5.5,0)])

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

    puts params

		redirect to '/menu'
  end

  get '/menu' do

  	@restaurants = add_restaurants

  	@client = CLIENT

  	erb :menu
  end

  post '/order' do

    #CLIENT.place_order(params[:dish],params[:quantity])

  	@dishes   = params[:dish]#,params[:quantity]] #--> use to_sym
    #quantity = params[:quantity]

  	#CLIENT.place_order(@dish,@quantity)

    erb :order
  end

  get '/order' do

    erb :order
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
