class AddPersonalizationToMeets < ActiveRecord::Migration[5.0]
  def change
    add_column :meets, :colorheader, :string
    add_column :meets, :colorbackground, :string
  end
end
