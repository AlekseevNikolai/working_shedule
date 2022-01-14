class CreateWorkdays < ActiveRecord::Migration[6.1]
  def change
    create_table :workdays do |t|
      t.datetime :date
      t.string :shift_code
      t.boolean :holiday, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
