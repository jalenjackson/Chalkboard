class AddTimeToMeets < ActiveRecord::Migration[5.0]
  def change
    add_column :meets, :date, :datetime
    add_column :meets, :time, :datetime

  end
end
