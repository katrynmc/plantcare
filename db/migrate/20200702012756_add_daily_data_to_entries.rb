class AddDailyDataToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :leaf_count, :integer
    add_column :entries, :plant_observations, :text
    add_column :entries, :date, :date
  end
end
