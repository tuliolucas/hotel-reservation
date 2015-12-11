# class Rates
class Rates
  attr_accessor :weekend_price
  attr_accessor :weekday_price

  def initialize(weekday_price, weekend_price)
    @weekend_price = weekend_price
    @weekday_price = weekday_price
  end

  def price(date)
    if date.saturday? || date.sunday?
      return weekend_price
    else return weekday_price
    end
  end
end
