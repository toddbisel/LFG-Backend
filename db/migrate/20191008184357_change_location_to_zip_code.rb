class ChangeLocationToZipCode < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :location, :zipcode
  end
end
