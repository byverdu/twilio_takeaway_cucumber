require "./app/lib/order"
require "./app/lib/dish"
require "./app/lib/user"

describe Order do
  
	let(:burger) { Dish.new('burger',5.50,2) }
	let(:fries)  { Dish.new('fries' ,1.50,3) }
	let(:user)   { User.new }

	it "will contain selected dishes" do
		expect(user.order.dishes).to be_a(Array)
	end

	it "has a total price" do
		expect(user.order.total_price).to be_a(Float)
	end

	it "can proceed one item" do
		user.place_order(burger,2)

		expect(user.order.proceed).to eq("Your order costs #{user.order.total_price}")
	end

	it "can proceed all the order" do
		user.place_order(burger,2)
		user.place_order(fries, 3)

		expect(user.order.proceed).to eq("Your order costs #{user.order.total_price}")
	end

	it "prints out the order" do
		user.place_order(burger,2)

		expect(user.order.print_out).to eq(["#{burger.quantity} #{burger.name}"])
	end
end