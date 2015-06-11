require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.  
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
	
	describe "initialize" do 
		before (:each) do 
			@cuboid_one = Cuboid.new(length: 3, width: 3, height: 4)
		end

		it "should have a length property" do 
			expect(@cuboid_one.length).to eq(3)
		end

		it "should have a width property" do 
			expect(@cuboid_one.width).to eq(3)
		end

		it "should have a height property" do 
			expect(@cuboid_one.height).to eq(4)
		end

		it "should have a default origin at center" do 
			expect(@cuboid_one.origin).to match_array([0,0,0])
		end

		it "should accept custom origin" do 
			@cuboid_two = Cuboid.new(length: 3, width: 3, height: 4, origin: [3,3,3])
			expect(@cuboid_two.origin).to match_array([3,3,3])
		end

		# it "should have eight verticies" do 
		# 	{@cuboid_one.verticies.length}.to eq(8)
		# end

	end


	describe "move_to" do
		it "changes the origin in the simple happy case" do
			expect(subject.move_to!(1,2,3)).to be true
		end
	end    
  
  describe "intersects?" do
  end

end
