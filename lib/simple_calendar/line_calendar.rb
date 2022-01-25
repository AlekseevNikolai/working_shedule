class SimpleCalendar::LineCalendar < SimpleCalendar::Calendar
  private

  def sor_events()
    {Date.new(2022, 1, 10) => [Workday.find(5)], Date.new(2022, 1, 11) => [Workday.find(6)]}
  end

  def date_range
    beginning = start_date.beginning_of_month
    ending    = start_date.end_of_month
    (beginning..ending).to_a
  end
end