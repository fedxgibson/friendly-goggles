class Database
	attr_reader :db

	def initialize
		@db = { 
			cities: [],
			cities_index: {},
			photos: {}
		}
	end

	def [](key)
		@db[key]
	end

	def []=(key, value)
		@db[key] = value
	end

	def reset
		@db = { 
			cities: [],
			cities_index: {},
			photos: []
		}
	end
end
