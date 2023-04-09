class City
	attr_accessor :photos, :count, :name

	def initialize(name)
		@name = name
		@photos = []
		@count = 0
	end

	def add_photo(photo)
		@photos << photo
		@count += 1
	end
end