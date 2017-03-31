class AddCategoryIndexToMeets < ActiveRecord::Migration[5.0]
  def change
    add_reference :meets, :category, index:true
  end
end
