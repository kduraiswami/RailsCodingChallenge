
class Cuboid

	attr_accessor :length, :width, :height, :origin, :vertices
	
	def initialize(dimensions={})
		@length = dimensions.fetch(:length)
		@width = dimensions.fetch(:width)
		@height = dimensions.fetch(:height)
		@origin = dimensions.fetch(:origin) {[0,0,0]}
		@vertices = []
		make_vertices
	end	

	def move_to!(x, y, z)
		@origin[0] = x
		@origin[1] = y
		@origin[2] = z
		make_vertices
	end

	def make_vertices
		#starts from closest top left corner and goes around clockwise [x,y,z] coordinates
		@vertices.insert(0, [(@width/-2)+@origin[0], (@length/-2)+@origin[1], (@height/2)+@origin[2]])
		@vertices.insert(1, [(@width/-2)+@origin[0], (@length/2)+@origin[1], (@height/2)+@origin[2]])
		@vertices.insert(2, [(@width/2)+@origin[0], (@length/2)+@origin[1], (@height/2)+@origin[2]])
		@vertices.insert(3, [(@width/2)+@origin[0], (@length/-2)+@origin[1], (@height/2)+@origin[2]])
		#starts from closet bottom left corner and goes around clockwise [x,y,z] coordinates
		@vertices.insert(4, [(@width/-2)+@origin[0], (@length/-2)+@origin[1], (@height/-2)+@origin[2]])
		@vertices.insert(5, [(@width/-2)+@origin[0], (@length/2)+@origin[1], (@height/-2)+@origin[2]])
		@vertices.insert(6, [(@width/2)+@origin[0], (@length/2)+@origin[1], (@height/-2)+@origin[2]])
		@vertices.insert(7, [(@width/2)+@origin[0], (@length/-2)+@origin[1], (@height/-2)+@origin[2]])
	end

	def intersects?(other)
	end

end
