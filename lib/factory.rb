require_relative '../models/photo'
require_relative '../models/city'

module Factory
	def self.create_photo(params)
		Photo.new(params)
	end

	def self.create_city(params)
		City.new(params)
	end
end