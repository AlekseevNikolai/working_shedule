class SimpleCalendar::LineCalendar < SimpleCalendar::Calendar

  private
  def date_range
    beginning = start_date.beginning_of_month
    ending    = start_date.end_of_month
    (beginning..ending).to_a
  end
end