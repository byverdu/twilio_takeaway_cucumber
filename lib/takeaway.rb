require_relative "dish"

class Takeaway

	attr_accessor :name, :number, :menu

	def initialize(name=nil, number=nil,menu=nil)
		@name    = name
		@number  = number
		@menu    =  []
	end
end