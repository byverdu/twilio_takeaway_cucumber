require './app/lib/dish'

describe Dish do

	let(:dish) { Dish.new('Scampi', 9.5,2) }

		it "has a name for the dish" do
			expect(dish.name).to eq('Scampi')
		end

		it "has a floating price" do
			expect(dish.price).to be_a(Float)
			expect(dish.price).to eq(9.5)
		end

		it "records the quantity needed" do
			expect(dish.quantity).to be_a(Integer)
		end
end

