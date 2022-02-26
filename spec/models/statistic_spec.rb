require 'rails_helper'
require 'roo'
require './spec/support/helpers/statistic.rb'

RSpec.configure do |c|
  c.include Helpers::Statistic
end

describe Statistic, type: :model do
  let_it_be(:workdays_data) {set_schedule}
  let_it_be(:all_holidays) { Holidays.new(2021) }
  
  # before_all do
  #   @workdays_data = set_schedule
  #   @alekseev = create(:alekseev)
  #   @alekseev_workdays = set_workdays_for(@alekseev, @workdays_data)
  # end

  # describe "#fact_hours" do
  #   subject {described_class.new(user, date_range).fact_hours}
  #   context "when date range is january for user Алексеев" do
  #     let_it_be(:user) {create :alekseev}

  #     let_it_be(:workdays) do
  #       workdays = workdays_data.select {|workday| workday[:name] == 'Алексеев'}
  #       workdays.each do |workday|
  #         create :workday, date: workday[:start_date], shift_code: workday[:shift_code], user: user
  #       end
  #     end

  #     let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

  #     it "should return corretct value" do
  #       is_expected.to eq(120)
  #     end
  #   end
  # end

  describe "#holiday_hours" do   
    context "for user Алексеев" do
      subject {described_class.new(user, date_range).holiday_hours}
      let_it_be(:user) {create :alekseev}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(31)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
    end

    context "for user Канцырева" do
      subject {described_class.new(user, date_range).holiday_hours}
      let_it_be(:user) {create :natalia}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(46)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(14)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(9)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(28)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(14)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(9)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
    end

    context "for user Тванкова" do
      subject {described_class.new(user, date_range).holiday_hours}
      let_it_be(:user) {create :natasha}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(55)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(14)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(14)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
    end

    context "for user Самохвалова" do
      subject {described_class.new(user, date_range).holiday_hours}
      let_it_be(:user) {create :masha}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(37)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
    end

    context "for user Шмаков" do
      subject {described_class.new(user, date_range).holiday_hours}
      let_it_be(:user) {create :vova}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(46)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(9)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
    end

    context "for user Петрова" do
      subject {described_class.new(user, date_range).holiday_hours}

      let_it_be(:user) {create :nastya}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(18)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(9)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
    end
    
  end

  describe "#fact_hours" do
    subject {described_class.new(user, date_range).fact_hours}

    context "for user Алексеев" do
      let_it_be(:user) {create :alekseev}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(158)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(152)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(190)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(190)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(79)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(182)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(94)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(204)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(103)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(168)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(159)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(167)
        end
      end
    end

    context "for user Канцыерва" do
      let_it_be(:user) {create :natalia}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(198)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(147)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(124)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(138)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(198)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(193)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end
    end

    context "for user Тванкова" do
      let_it_be(:user) {create :natasha}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(147)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(207)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(138)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(92)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(193)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(115)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end
    end

    context "for user Самохвалова" do
      let_it_be(:user) {create :masha}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(115)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end
    end

    context "for user Шмаков" do
      let_it_be(:user) {create :vova}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(207)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(69)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(170)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(161)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(92)
        end
      end
    end

    context "for user Петрова" do
      let_it_be(:user) {create :nastya}
      let_it_be(:workdays) {set_workdays_for(user, workdays_data)}

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(32)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(192)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(193)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(207)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(184)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(198)
        end
      end
      
      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(170)
        end
      end

      context "when date range is october" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(138)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(138)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(157)
        end
      end
    end

  end

  describe "#plan_hours" do
    subject {described_class.new(user, date_range).plan_hours}

    context "For user Алексеев" do
      let_it_be(:user) { create :alekseev }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(120)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(151)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(72)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(167)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(72)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(96)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(168)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(159)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end
    end

    context "For user Канцыерва" do
      let_it_be(:user) { create :natalia }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(120)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(151)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(136)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(152)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(167)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(128)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(136)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(136)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(168)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(159)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end
    end

    context "For user Тванкова" do
      let_it_be(:user) { create :natasha }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(120)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(151)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(128)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(112)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(167)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(96)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(168)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(119)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end
    end

    context "For user Самохвалова" do
      let_it_be(:user) { create :masha }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(120)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(151)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(96)
        end
      end
    end

    context "For user Шмаков" do
      let_it_be(:user) { create :vova }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(120)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(151)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(152)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(64)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(168)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(159)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(96)
        end
      end
    end

    context "For user Петрова" do
      let_it_be(:user) { create :nastya }
      let_it_be(:workdays) { set_workdays_for(user, workdays_data) }
      

      context "when date range is january" do
        let_it_be(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 1, 31) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is february" do
        let_it_be(:date_range) { Date.new(2021, 2, 1)..Date.new(2021, 2, 28) }

        it "should return correct value" do
          is_expected.to eq(0)
        end
      end

      context "when date range is march" do
        let_it_be(:date_range) { Date.new(2021, 3, 1)..Date.new(2021, 3, 31) }

        it "should return correct value" do
          is_expected.to eq(32)
        end
      end

      context "when date range is april" do
        let_it_be(:date_range) { Date.new(2021, 4, 1)..Date.new(2021, 4, 30) }

        it "should return correct value" do
          is_expected.to eq(175)
        end
      end

      context "when date range is may" do
        let_it_be(:date_range) { Date.new(2021, 5, 1)..Date.new(2021, 5, 31) }

        it "should return correct value" do
          is_expected.to eq(152)
        end
      end

      context "when date range is june" do
        let_it_be(:date_range) { Date.new(2021, 6, 1)..Date.new(2021, 6, 30) }

        it "should return correct value" do
          is_expected.to eq(167)
        end
      end

      context "when date range is july" do
        let_it_be(:date_range) { Date.new(2021, 7, 1)..Date.new(2021, 7, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is august" do
        let_it_be(:date_range) { Date.new(2021, 8, 1)..Date.new(2021, 8, 31) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is september" do
        let_it_be(:date_range) { Date.new(2021, 9, 1)..Date.new(2021, 9, 30) }

        it "should return correct value" do
          is_expected.to eq(176)
        end
      end

      context "when date range is oktober" do
        let_it_be(:date_range) { Date.new(2021, 10, 1)..Date.new(2021, 10, 31) }

        it "should return correct value" do
          is_expected.to eq(128)
        end
      end

      context "when date range is november" do
        let_it_be(:date_range) { Date.new(2021, 11, 1)..Date.new(2021, 11, 30) }

        it "should return correct value" do
          is_expected.to eq(136)
        end
      end

      context "when date range is december" do
        let_it_be(:date_range) { Date.new(2021, 12, 1)..Date.new(2021, 12, 31) }

        it "should return correct value" do
          is_expected.to eq(144)
        end
      end
    end

  end

  describe "#overworking_hours" do
    subject {described_class.new(user, date_range).overworking_hours}

    context "for user Алексеев" do
      let!(:user) {create :alekseev}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(107)
      end
    end

    context "for user Канцырева" do
      let!(:user) {create :natalia}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(113)
      end
    end

    context "for user Тванкова" do
      let!(:user) {create :natasha}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(117)
      end
    end

    context "for user Самохвалова" do
      let!(:user) {create :masha}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(33)
      end
    end

    context "for user Шмаков" do
      let!(:user) {create :vova}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(111)
      end
    end

    context "for user Петрова" do
      let!(:user) {create :nastya}
      let!(:workdays) { set_workdays_for(user, workdays_data) }
      let!(:date_range) { Date.new(2021, 1, 1)..Date.new(2021, 12, 31) }

      it "should return correct value" do
        is_expected.to eq(120)
      end
    end
  end
end