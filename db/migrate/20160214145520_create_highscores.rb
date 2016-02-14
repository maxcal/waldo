class CreateHighscores < ActiveRecord::Migration
  def change
    create_table :highscores do |t|
      t.string :username
      t.integer :score
      t.integer :time
      t.timestamps null: false
    end
  end
end
