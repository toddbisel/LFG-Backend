class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :zipcode
      t.string :image

      t.timestamps
    end
  end
end
