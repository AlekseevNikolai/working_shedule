class Holidays
  attr_accessor :holidays, :preholidays, :weekends
  
  def initialize(year)
    all_holidays = get_holidays_api(year)
    @weekends = all_holidays["holidays"]
    @holidays = get_holidays_parse(year)
    @preholidays = all_holidays["preholidays"]
  end
  
  def get_holidays_api(year)
    source = "https://raw.githubusercontent.com/d10xa/holidays-calendar/master/json/consultant#{year}.json"
    resp = Net::HTTP.get_response(URI.parse(source))
    holidays = JSON.parse(resp.body)
    holidays_to_date(holidays)
  end

  def get_holidays_parse(year)
    url = "http://www.consultant.ru/law/ref/calendar/proizvodstvennye/#{year}/"
    doc = Nokogiri::HTML(URI.open(url))
    # "1, 2, 3, 4, 5, 6 и 8 января — Новогодние каникулы; 7 января — Рождество Христово; .."
    text_holidays = doc.xpath("//blockquote")[0].text.split("\n").reject { |c| c.empty? }
    # "1, 2, 3, 4, 5, 6 и 8 января"
    text_holidays.map! {|holiday| holiday.slice(0..((holiday.index('—') || holiday.index('-')) - 2))}

    holidyas_month = Hash.new
    text_holidays.each do |holiday|
      if holidyas_month[holiday.split(' ').last]
        holidyas_month[holiday.split(' ').last] += " " + holiday.scan(/\d+/).join(' ')
      else
        holidyas_month[holiday.split(' ').last] = holiday.scan(/\d+/).join(' ')
      end
    end

    holidyas_month.transform_keys! {|k| month_to_num(k) || k}

    result = []
    holidyas_month.each do |month, days|
      days.split(" ").each do |day|
        result << Date.parse("#{day}-#{month}-#{year}")
      end
    end

    result
  end

  def holidays_to_date(holidays)
    holidays.each_key do |key|
      holidays[key].map! {|string_date| Date.parse(string_date)}
    end
  end

  def month_to_num(month)
    month = month.slice(0..2).downcase
    dict = {'янв' => 1, 'фев' => 2, 'мар' => 3, 'апр' => 4, 'мая' => 5, 'май' => 5, 'июн' => 6,
    'июл' => 7, 'авг' => 8, 'сен' => 9, 'окт' => 10, 'ноя' => 11, 'дек' => 12 }
    dict[month] if dict[month]
  end  
end