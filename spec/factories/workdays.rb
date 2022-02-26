FactoryBot.define do
  factory :workday do
    association :user
    date { Date.today }
    shift_code { "ВЫХ" }
  end
end
  