require_relative 'factory'

class Store
	attr_reader :cities, :photos

	def initialize(db)
		@db = db
		@cities = Cities.new(@db)
		@photos = Photos.new(@db)
	end

	class Cities
		def initialize(db)
			@db = db
		end

		def find_by_or_create(name)
			return @db[:cities_index][name] if @db[:cities_index][name]

			city = Factory.create_city(name)
			@db[:cities] << city
			@db[:cities_index][name] = city
		end

		def list
			@db[:cities]
		end
	end

	class Photos
		def initialize(db)
			@db = db
		end

		def create(params)
			photo = Factory.create_photo(params)
			@db[:photos] << photo
			photo
		end
	end
end
