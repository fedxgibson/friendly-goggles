require 'test/unit'

base_dir = File.expand_path(File.join(File.dirname(__FILE__), "."))
test_dir = File.join(base_dir, "specs/tests.rb")

exit Test::Unit::AutoRunner.run(true, test_dir)