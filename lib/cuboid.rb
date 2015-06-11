
class Cuboid

	attr_accessor :length, :width, :height, :origin
	
	def initialize(dimensions={})
		@length = dimensions.fetch(:length)
		@width = dimensions.fetch(:width)
		@height = dimensions.fetch(:height)
		@origin = dimensions.fetch(:origin) {[0,0,0]}
	end	

	def vertices
	end

	def move_to!(x, y, z)
	end

	def intersects?(other)
	end

end
