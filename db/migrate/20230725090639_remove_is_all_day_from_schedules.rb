class RemoveIsAllDayFromSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedules, :is_all_day, :boolean
    add_column :schedules, :is_all_day, :boolean, default: false , null: false
  end
end
