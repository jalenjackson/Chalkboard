class AddLatLonToMeets < ActiveRecord::Migration[5.0]
  def change
    add_column :meets, :latitude, :float
    add_column :meets, :longitude, :float
  end
end
