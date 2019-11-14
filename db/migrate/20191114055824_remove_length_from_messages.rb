class RemoveLengthFromMessages < ActiveRecord::Migration[6.0]
  def change

    remove_column :messages, :length, :integer
  end
end
