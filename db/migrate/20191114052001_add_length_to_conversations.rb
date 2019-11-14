class AddLengthToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :length, :integer
  end
end
