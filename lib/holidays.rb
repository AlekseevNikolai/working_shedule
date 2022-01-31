class Holidays
  attr_accessor :holidays, :preholidays
  
  def initialize
    all_holidays = get_holidays(Date.today.year)
    @holidays = all_holidays["holidays"]
    @preholidays = all_holidays["preholidays"]
  end
  
  def get_holidays(year)
    source = "https://raw.githubusercontent.com/d10xa/holidays-calendar/master/json/consultant#{year}.json"
    resp = Net::HTTP.get_response(URI.parse(source))
    holidays = JSON.parse(resp.body)
  end
end