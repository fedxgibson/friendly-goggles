class Photo
	attr_reader :name, :ext, :city, :time, :order

	def initialize(params)
		@name = params[:name]
		@ext = params[:ext]
		@city = params[:city]
		@time = params[:time]
		@order = params[:order]
	end

	def format_name(index)
		"%s%0#{city.count.to_s.length}d.%s" % [city.name, index + 1, ext]
	end
end