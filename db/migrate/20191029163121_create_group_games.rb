class CreateGroupGames < ActiveRecord::Migration[6.0]
  def change
    create_table :group_games do |t|
      t.integer :group_id
      t.integer :game_id

      t.timestamps
    end
  end
end
