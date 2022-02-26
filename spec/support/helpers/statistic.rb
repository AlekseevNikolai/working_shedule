module Helpers
  module Statistic
    def set_schedule
      workbook = Roo::Spreadsheet.open(file_fixture("schedule_exceles/Schedule2021.xlsx").to_s)
      # workbook.default_sheet = workbook.sheets[0]
      schedule = []
      workbook.each_with_pagename do |name, sheet|
        sheet.each(name: sheet.row(1)[0], start_date: sheet.row(1)[1], end_date: sheet.row(1)[2], shift_code: sheet.row(1)[3]) do |hash|
          schedule << hash
        end
      end
      schedule
    end

    def set_workdays_for(user, workdays_data)
      workdays = workdays_data.select {|workday| workday[:name] == user.last_name}
      all_holidays = Holidays.new(workdays.last[:start_date].to_date.year)
        workdays.each do |workday|
          if workday[:shift_code]
            workday = Workday.new(date: workday[:start_date], shift_code: workday[:shift_code], user: user)
            workday.holiday = true if all_holidays.holidays.include? workday.date.to_date
            workday.preholiday = true if all_holidays.preholidays.include? workday.date.to_date
            workday.save
          end
        end
    end
  end
end