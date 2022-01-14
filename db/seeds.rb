# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


workingdays_mass = [10, 11, 12, 13, 14,
                    17, 18, 19, 20, 21,
                    24, 25, 26, 27, 28, 31]
workingdays_mass.each do |date|
  Workday.create!(date: DateTime.new(2021, 01, date),
                  shift_code: 'ГН24',
                  user_id:2)
end