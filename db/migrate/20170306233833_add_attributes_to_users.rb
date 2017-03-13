class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change

    #teachers
    add_column :users, :points, :integer, default: 0
    add_column :users, :stars, :integer, default: 0
    add_column :users, :achievements, :integer, default: 0
    add_column :users, :classes, :string
    add_column :users, :classnum, :integer, default: 0

  end
end
