require 'dish'

describe Dish do

	let(:dish) { Dish.new('Scampi', 9.5) }

	context "when is initialized" do

		it "has a name for the dish" do
			expect(dish.name).to eq('Scampi')
		end

		it "has a floating price" do
			expect(dish.price).to be_a(Float)
			expect(dish.price).to eq(9.5)
		end
	end

	

end

