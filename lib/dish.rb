class Dish

	attr_accessor  :name, :price, :quantity

	def initialize(name,price,quantity)
		@name     = name
		@price    = price
		@quantity = 0
	end
end