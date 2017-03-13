class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :fullname
      t.string :grade
      t.string :description

      t.timestamps
    end
  end
end
