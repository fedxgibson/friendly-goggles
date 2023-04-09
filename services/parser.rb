
class Parser
	REGEXP = /(\w+)\.(jpg|png|jpeg),\s*(\w+),\s*(\d{4}-\d{2}-\d{2}\s*\d{2}:\d{2}:\d{2})/

	def parse_item(item)
		parsed_item = REGEXP.match(item)
		{ 
			name: parsed_item[1],
			ext: parsed_item[2],
			city: parsed_item[3],
			time: parsed_item[4]
		}
	end

	def parse_input(input)
		input.split('\n')
	end
end