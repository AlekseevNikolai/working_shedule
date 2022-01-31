class AddPreholidyaToWorkdays < ActiveRecord::Migration[6.1]
  def change
    add_column :workdays, :preholiday, :boolean, default: false
  end
end
