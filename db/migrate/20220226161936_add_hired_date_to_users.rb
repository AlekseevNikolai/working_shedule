class AddHiredDateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hired_date, :datetime
  end
end
