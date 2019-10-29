class AddLatLongToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :groups, :latitude, :float
    add_column :groups, :longitude, :float
  end
end
