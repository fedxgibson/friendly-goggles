require 'test/unit'
require_relative './naming_service'
 
class NamingServiceTest < Test::Unit::TestCase
  def test_base_case
    result = NamingService.solution('')
    assert_equal(result, '')
  end

  def test_one_photo_one_city
    input = [
			'pisatower.jpg, Florianopolis, 2015-07-22 23:59:59',
		]
		output = %w(
			Florianopolis1.jpg
		)
    result = NamingService.solution(input.join('\n'))
    assert_equal(result, output.join('\n'))
	rescue StandardError => e 
		puts e.backtrace.inspect
  end

  def test_two_photos_one_city
    input = [
			'pisatower.jpg, Florianopolis, 2015-07-22 23:59:59',
			'Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02',
		]
		output = %w(
			Florianopolis1.jpg
			Florianopolis2.jpg
		)
    result = NamingService.solution(input.join('\n'))
    assert_equal(result, output.join('\n'))
  end

  def test_two_photos_one_city_different_order
    input = [
			'Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02',
			'pisatower.jpg, Florianopolis, 2015-07-22 23:59:59',
		]
		output = %w(
			Florianopolis2.jpg
			Florianopolis1.jpg
		)
    result = NamingService.solution(input.join('\n'))
    assert_equal(result, output.join('\n'))
  end

  def test_two_photos_two_cities_different_order
    input = [
			'Mike.png, London, 2015-06-20 15:13:22',
			'Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02',
			'pisatower.jpg, Florianopolis, 2015-07-22 23:59:59',
			'BOB.jpg, London, 2015-08-05 00:02:03'
		]
		output = %w(
			London1.png
			Florianopolis2.jpg
			Florianopolis1.jpg
			London2.jpg
		)
    result = NamingService.solution(input.join('\n'))
    assert_equal(result, output.join('\n'))
  end

  def test_ten_photos_one_city
    input = [
			'photo.jpg, Krakow, 2013-09-05 14:08:15',
			'myFriends.png, Krakow, 2013-09-05 14:07:13',
			'me.jpg, Krakow, 2013-09-06 15:40:22',
			'a.png, Krakow, 2016-02-13 13:33:50',
			'b.jpg, Krakow, 2016-01-02 15:12:22',
			'c.jpg, Krakow, 2016-01-02 14:34:30',
			'd.jpg, Krakow, 2016-01-02 15:15:01',
			'e.png, Krakow, 2016-01-02 09:49:09',
			'f.png, Krakow, 2016-01-02 10:55:32',
			'g.jpg, Krakow, 2016-02-29 22:13:11'
		]
		output = %w(
			Krakow02.jpg
			Krakow01.png
			Krakow03.jpg
			Krakow09.png
			Krakow07.jpg
			Krakow06.jpg
			Krakow08.jpg
			Krakow04.png
			Krakow05.png
			Krakow10.jpg
		)
    result = NamingService.solution(input.join('\n'))
    assert_equal(result, output.join('\n'))
  end
end