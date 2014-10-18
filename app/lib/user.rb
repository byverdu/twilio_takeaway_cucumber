require 'rubygems'
require_relative "order"
require_relative "hide"


class User

	include Sms
     
	attr_accessor :name, :number, :order, :status 

	def initialize(name=nil,number=nil)
		@name     = name
		@number   = number
		@status   = nil
		@order    = Order.new
	end

	def place_order(dish, quantity)
		@status   = 'order placed'
		
		dish.quantity = quantity

		@order.dishes << dish 

		@order.dishes.flatten
	end

	def send_sms

		client = Twilio::REST::Client.new Sms::ACCOUNT_SID, Sms::AUTH_TOKEN
		

		client.account.messages.create(
      :from => '+443487935472',
      :to   => '+447720860376',
      :body => "Customer: #{@name} \n Total: #{@order.total_price} \n Your order will be at your door in one hour #{Time.now.hour + 1}:#{Time.now.min}"
    )
	end
end
