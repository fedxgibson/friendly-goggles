require 'singleton'
require_relative 'services/parser'
require_relative 'lib/database'
require_relative 'lib/store'

class System
	include Singleton

	attr_reader :services

	def initialize
		@services = {}
		@services[:parser] = Parser.new
		@services[:db] = Database.new
		@services[:store] = Store.new(@services[:db])
	end
end
