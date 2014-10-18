require_relative "dish"

class Order

	attr_accessor  :dishes, :total_price

	def initialize
		@dishes = []
		@total_price = 0.0
	end

	def proceed

		sub_total = 0.0

		@dishes.map do |dish|  

			sub_total = dish.price * dish.quantity 

			@total_price += sub_total
		end
		
		"Your order costs #{@total_price}"
	end

	def print_out
		@dishes.map { |dish| "#{dish.quantity} #{dish.name}"}
	end

end