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

	describe "vertices" do 
		before (:each) do
			@cuboid_vertices = Cuboid.new(length: 4, width: 4, height: 4) 
		end

		it "should have eight vertices" do 
			expect(@cuboid_vertices.vertices.length).to eq(8)
		end
		#top face
		it "should have a closest top left verticy of [-2,-2,2]" do
			expect(@cuboid_vertices.vertices[0]).to match_array([-2,-2,2])
		end

		it "should have a furthest top left verticy of [-2,2,2]" do
			expect(@cuboid_vertices.vertices[1]).to match_array([-2,2,2])
		end

		it "should have a furthest top right verticy of [2,2,2]" do
			expect(@cuboid_vertices.vertices[2]).to match_array([2,2,2])
		end

		it "should have a closest top right verticy of [2,-2,2]" do
			expect(@cuboid_vertices.vertices[3]).to match_array([2,-2,2])
		end

		#bottom face
		it "should have a closest bottom left verticy of [-2,-2,-2]" do
			expect(@cuboid_vertices.vertices[4]).to match_array([-2,-2,-2])
		end

		it "should have a furthest bottom left verticy of [-2,2,-2]" do
			expect(@cuboid_vertices.vertices[5]).to match_array([-2,2,-2])
		end

		it "should have a furthest bottom right verticy of [2,2,-2]" do
			expect(@cuboid_vertices.vertices[6]).to match_array([2,2,-2])
		end

		it "should have a closest bottom right verticy of [2,-2,-2]" do
			expect(@cuboid_vertices.vertices[7]).to match_array([2,-2,-2])
		end
	end

	describe "move_to" do

		before (:each) do 
			@cuboid_mover = Cuboid.new(length: 4, width: 4, height: 4) 
			@cuboid_mover.move_to!(2,2,2)
		end

		it "should change the origin to (2,2,2)" do 
			expect(@cuboid_mover.origin).to eq([2,2,2])
		end

		#top face
		it "should have a closest top left verticy of [0,0,4]" do
			expect(@cuboid_mover.vertices[0]).to match_array([0,0,4])
		end

		it "should have a furthest top left verticy of [0,4,4]" do
			expect(@cuboid_mover.vertices[1]).to match_array([0,4,4])
		end

		it "should have a furthest top right verticy of [4,4,4]" do
			expect(@cuboid_mover.vertices[2]).to match_array([4,4,4])
		end

		it "should have a closest top right verticy of [4,0,4]" do
			expect(@cuboid_mover.vertices[3]).to match_array([4,0,4])
		end

		#bottom face
		it "should have a closest bottom left verticy of [0,0,0]" do
			expect(@cuboid_mover.vertices[4]).to match_array([0,0,0])
		end

		it "should have a furthest bottom left verticy of [0,4,0]" do
			expect(@cuboid_mover.vertices[5]).to match_array([0,4,0])
		end

		it "should have a furthest bottom right verticy of [4,4,0]" do
			expect(@cuboid_mover.vertices[6]).to match_array([4,4,0])
		end

		it "should have a closest bottom right verticy of [4,0,0]" do
			expect(@cuboid_mover.vertices[7]).to match_array([4,0,0])
		end

		# it "changes the origin in the simple happy case" do
		# 	expect(@cuboid_mover.move_to!(1,2,3)).to be true
		# end
	end

	describe "does_not_intersect?" do

		it "should return true for cuboids in separate places" do 
			cuboid_one = Cuboid.new(length: 4, width: 4, height: 4)
			cuboid_two = Cuboid.new(length: 4, width: 4, height: 4, origin: [8,8,8])  
			expect(cuboid_one.does_not_intersect?(cuboid_two.vertices)).to be true
		end

		it "should return false for cuboids with one verticy touching" do 
			cuboid_one = Cuboid.new(length: 4, width: 4, height: 4)
			cuboid_two = Cuboid.new(length: 4, width: 4, height: 4, origin: [4,4,4])  
			expect(cuboid_one.does_not_intersect?(cuboid_two.vertices)).to be false
		end

		it "should return false for cuboids with intersecting faces" do 
			cuboid_one = Cuboid.new(length: 4, width: 4, height: 4)
			cuboid_two = Cuboid.new(length: 4, width: 4, height: 4, origin: [2,2,2])  
			expect(cuboid_one.does_not_intersect?(cuboid_two.vertices)).to be false
		end


	end

end
