require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.  
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
	
	describe "initialize" do 
		before (:each) do 
			@cuboid_initial = Cuboid.new(length: 3, width: 3, height: 4)
		end

		it "should have a length property" do 
			expect(@cuboid_initial.length).to eq(3)
		end

		it "should have a width property" do 
			expect(@cuboid_initial.width).to eq(3)
		end

		it "should have a height property" do 
			expect(@cuboid_initial.height).to eq(4)
		end

		it "should have a default origin [0,0,0] at center" do 
			expect(@cuboid_initial.origin).to match_array([0,0,0])
		end

		it "should accept custom origin" do 
			@cuboid_intial_two = Cuboid.new(length: 3, width: 3, height: 4, origin: [3,3,3])
			expect(@cuboid_intial_two.origin).to match_array([3,3,3])
		end


	end

	describe "verticies" do 
		before (:each) do
			@cuboid_verticies = Cuboid.new(length: 4, width: 4, height: 4) 
		end

		it "should have eight verticies" do 
			expect(@cuboid_verticies.verticies.length).to eq(8)
		end
		#top face
		it "should have a closest top left verticy of [-2,-2,2]" do
			expect(@cuboid_verticies.verticies[0]).to match_array([-2,-2,2])
		end

		it "should have a furthest top left verticy of [-2,2,2]" do
			expect(@cuboid_verticies.verticies[1]).to match_array([-2,2,2])
		end

		it "should have a furthest top right verticy of [2,2,2]" do
			expect(@cuboid_verticies.verticies[2]).to match_array([2,2,2])
		end

		it "should have a closest top right verticy of [2,-2,2]" do
			expect(@cuboid_verticies.verticies[3]).to match_array([2,-2,2])
		end

		#bottom face
		it "should have a closest bottom left verticy of [-2,-2,-2]" do
			expect(@cuboid_verticies.verticies[4]).to match_array([-2,-2,-2])
		end

		it "should have a furthest bottom left verticy of [-2,2,-2]" do
			expect(@cuboid_verticies.verticies[5]).to match_array([-2,2,-2])
		end

		it "should have a furthest bottom right verticy of [2,2,-2]" do
			expect(@cuboid_verticies.verticies[6]).to match_array([2,2,-2])
		end

		it "should have a closest bottom right verticy of [2,-2,-2]" do
			expect(@cuboid_verticies.verticies[7]).to match_array([2,-2,-2])
		end
	end

	describe "move_to" do
		it "changes the origin in the simple happy case" do
			expect(subject.move_to!(1,2,3)).to be true
		end
	end    
  
  describe "intersects?" do
  end

end
