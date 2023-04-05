=begin
	The solution has complexity O(NlogN).
	Explaination:
		1 - n.split('\n').each_with_object({}).with_index = this loop takes N operations to complete
				and there aren't any costly operation in each iteration.
		2 -
			If we assume C the amount of cities and P, an even distribution of photos per city so that C*P = N.
			We previously create the array that holds the solution with capacity input.size so insertions are O(1)
			.each_with_object(Array.new(input.size)) do |(city, value), solution| => C operations
					value[:photos].sort_by! { |photo| photo[:time] } =>  O(PlogP)
					.each_with_object(solution).with_index do |(photo, solution), index| => P operations
						solution[photo[:order]] = "%s%0#{value[:count].digits.count}d.%s" % [city, index + 1, photo[:ext]] => 1
					end
				end

				N operations + C*(O(P*logP) + P) operations = N + C*O(P*logP) + C*P.  
				= O(N) + O(C*P*logP) + O(N) = max { O(N), O(C*P*logP), O(N) } = O(NlogP) <= O(NlogN). (1)

				(1) Because P <= N by definition we have that logP <= logN so we found an upper bound.

	The solution has space complexity O()
				1 - input = n.split('\n') = this creates a new array of size N
				2 - input.each_with_object({}) = this will create a hash that is going to hold N elements in total (C cities and P photos)
				3 - each_with_object(Array.new(input.size)) = this will create a new array of size N (Once)
				4 - value[:photos].sort_by! { |photo| photo[:time] } = quicksort is O(number of elements)= O(P) (functions call in call stack)
				
				N + N + N + C*P = 4*N = O(4N) = O(N)

=end

class NamingService
	class << self

		REGEXP = /(\w+)\.(jpg|png|jpeg),\s*(\w+),\s*(\d{4}-\d{2}-\d{2}\s*\d{2}:\d{2}:\d{2})/

		def solution(n)
			input = n.split('\n')
			input.each_with_object({}).with_index do |(item, grouped), order|
				parsed_item = REGEXP.match(item)
				photo_obj = { name: parsed_item[1], ext: parsed_item[2], city: parsed_item[3], time: parsed_item[4] }
				grouped[photo_obj[:city]] = { photos: [], count: 0 } if grouped[photo_obj[:city]].nil?
				photo_obj[:order] = order
				grouped[photo_obj[:city]][:photos] << photo_obj
				grouped[photo_obj[:city]][:count] += 1
			end
			.each_with_object(Array.new(input.size)) do |(city, value), solution|
				value[:photos].sort_by! { |photo| photo[:time] }
				.each_with_object(solution).with_index do |(photo, solution), index|
					solution[photo[:order]] = "%s%0#{value[:count].digits.count}d.%s" % [city, index + 1, photo[:ext]]
				end
			end
			.join('\n')
		end
	end
end

