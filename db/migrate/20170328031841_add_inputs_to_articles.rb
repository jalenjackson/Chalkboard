class AddInputsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :description, :string
  end
end
