class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :score
      t.jsonb :board_state
      t.boolean :game_over

      t.timestamps
    end
  end
end
