class AddSubjectToPins < ActiveRecord::Migration[5.0]
  def change

    add_column :pins, :subject, :string

  end
end
