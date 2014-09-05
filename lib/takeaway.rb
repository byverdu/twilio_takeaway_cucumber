require "dish"

class Takeaway

	attr_accessor :name, :number, :menu

	def initialize(name=nil, number=nil)
		@name    = name
		@number  = number
		@menu    =  create_menu
	end

	def create_menu
		dishes = [Dish.new('scampi',8.5),Dish.new('coleslaw',2.5),Dish.new('burger',4.5),Dish.new('coke',1.5),Dish.new('fish cake',5.5)]

		dishes
	end

end