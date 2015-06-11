
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


	def does_not_intersect?(potential_conflict_vertices)
		if compare_vertices(@vertices, potential_conflict_vertices)
			true
		else 
			false 
		end
	end

	private

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
	
	def compare_vertices(vertices, potential_conflict_vertices)
		#check if left face is to the left of conflict right face
		if vertices[0][0] <= potential_conflict_vertices[3][0] && vertices[0][0] >= potential_conflict_vertices[0][0]
			false
		#check if right face is to the right of conflict left face
		elsif vertices[3][0] >= potential_conflict_vertices[0][0] && vertices[3][0] >= potential_conflict_vertices[3][0]
			false
		#check if close face is further than conflict close face
		elsif vertices[0][1] >= potential_conflict_vertices[0][1] && vertices[1][1] <= potential_conflict_vertices[1][1]
			false
		#check if further face is closer than conflict further face
		elsif vertices[1][1] <= potential_conflict_vertices[1][1] && vertices[1][1] >= potential_conflict_vertices[0][1]
			false
		#check if top face is above conflict bottom face
		elsif vertices[0][2] >= potential_conflict_vertices[4][2] && vertices[0][2] <= potential_conflict_vertices[0][2]
			false
		#check if bottom face is below conflict top face
		elsif vertices[4][2] <= potential_conflict_vertices[0][2] && vertices[4][2] >= potential_conflict_vertices[4][2]
			false
		else
			true
		end
	end

end
