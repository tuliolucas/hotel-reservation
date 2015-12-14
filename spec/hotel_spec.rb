require_relative '../lib/rates'
require_relative '../lib/hotel'
require_relative '../lib/hotel_chain'

describe HotelChain do
  subject do
    hotels = [
      Hotel.new('Lakewood', 3),
      Hotel.new('Bridgewood', 4),
      Hotel.new('Ridgewood', 5)
    ]
    hotels[0].normal_rate = Rates.new(110, 90)
    hotels[0].reward_rate = Rates.new(80, 80)
    hotels[1].normal_rate = Rates.new(160, 60)
    hotels[1].reward_rate = Rates.new(110, 50)
    hotels[2].normal_rate = Rates.new(220, 150)
    hotels[2].reward_rate = Rates.new(100, 40)
    HotelChain.new('Oton Palace Hotel', hotels)
  end

  it 'should exists three hotels' do
    expect(subject.hotels.length).to eq(3)
  end
  it 'should exists a hotel called Lakewood' do
    expect(subject.hotels[0].name).to eq('Lakewood')
  end
  it 'should existing hotels have their differents rates' do
    lakewood = subject.hotels[0]
    expect(lakewood.rating).to eq(3)
    bridgewood = subject.hotels[1]
    expect(bridgewood.rating).to eq(4)
    ridgewood = subject.hotels[2]
    expect(ridgewood.rating).to eq(5)
  end
  it 'should find the cheapest hotel for normal customer' do
    dates = ['16Mar2009(mon)', '17Mar2009(tues)', '18Mar2009(wed)']
    hotel = subject.find_cheapest_hotel(true, dates)
    expect(hotel.name).to eq('Lakewood')
  end
  it 'should find the cheapest hotel for special customer' do
    dates = ['26Mar2009(thur)', '27Mar2009(fri)', '28Mar2009(sat)']
    hotel = subject.find_cheapest_hotel(false, dates)
    expect(hotel.name).to eq('Ridgewood')
  end
end
