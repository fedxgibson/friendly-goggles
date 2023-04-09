class Solution
	def initialize(size)
		@data = Array.new(size)
	end

	def add_photo(index, name)
		@data[index] = name
	end

	def output
		@data.join('\n')
	end
end