require "takeaway"

describe Takeaway do

	let(:takeaway) { Takeaway.new('Casa Ramiro', '07730879056', []) }

	let(:dish) { double :dish, name: 'scampi' }


	it "has his own name" do
		expect(takeaway.name).to eq('Casa Ramiro')
	end

	it "has a telephone number" do
		expect(takeaway.number).to eq('07730879056')
	end

	it "has a menu with several dishes" do
		expect(takeaway.menu).to be_a(Array)
		#expect(takeaway.menu.first.name).to eq(dish.name)	
	end
end