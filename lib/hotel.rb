require 'date'

# Class hotel
class Hotel
  attr_accessor :name
  attr_accessor :normal_rate
  attr_accessor :reward_rate
  attr_accessor :rating

  def initialize(name, rating)
    @name = name
    @rating = rating
    @rates = {}
  end

  def price(is_normal_rate, sdate)
    if is_normal_rate
      rate = normal_rate
    else
      rate = reward_rate
    end
    sdate = sdate.gsub('tues', 'tue')
    sdate = sdate.gsub('thur', 'thu')
    date_formated = Date.strptime(sdate, '%d%b%Y(%a)')
    rate.price(date_formated)
  end
end
