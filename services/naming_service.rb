require_relative 'solution'

class NamingService
	def initialize(system)
		@system = system
		@parser = @system.services[:parser]
		@db = @system.services[:db]
		@store = @system.services[:store]
	end

	def solution(n)
		input = @parser.parse_input(n)
		input.each_with_index do |item, order|
			parsed_item = @parser.parse_item(item)
			city = @system.services[:store].cities.find_by_or_create(parsed_item[:city])
			photo = @system.services[:store].photos.create(parsed_item.merge!(city: city, order: order))
			city.add_photo(photo)
		end
		@system.services[:store]
			.cities
			.list
			.each_with_object(Solution.new(input.size)) do |city, solution|
				city.photos.sort_by!(&:time)
				city.photos.each_with_object(solution).with_index do |(photo, solution), index|
					solution.add_photo(photo.order, photo.format_name(index))
				end
			end
			.output
	end
end

