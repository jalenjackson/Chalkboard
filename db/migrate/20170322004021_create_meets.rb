class CreateMeets < ActiveRecord::Migration[5.0]
  def change
    create_table :meets do |t|

      t.string :name
      t.text :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :email
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
    end

  end
end
