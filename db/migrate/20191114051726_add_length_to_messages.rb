class AddLengthToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :length, :integer
  end
end
