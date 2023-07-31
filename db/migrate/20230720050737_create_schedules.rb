class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :starting_date
      t.date :ending_date
      t.boolean :is_all_day
      t.text :memo
      t.datetime :update_date
      
      t.timestamps
    end
  end
end

