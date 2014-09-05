class Takeaway

	attr_accessor :name, :number, :menu

	def initialize(name=nil, number=nil, menu)
		@name    = name
		@number  = number
		@menu    = menu
	end
end