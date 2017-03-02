class AddBodyToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :body, :string
  end
end
