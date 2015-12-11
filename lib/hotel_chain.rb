# Class chain of hotels
class HotelChain
  attr_accessor :name
  attr_accessor :hotels

  def initialize(name, hotels)
    @name = name
    @hotels = hotels
  end

  def find_cheapest_hotel(is_normal_rate, dates)
    map = {}
    hotels.each do |hotel|
      total_price = 0
      dates.each do |date|
        total_price += hotel.price(is_normal_rate, date)
      end
      map[hotel.name] = total_price
    end
    puts(map.keys)
    map.first[0]
  end
end
