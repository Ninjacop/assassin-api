class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :kills
      t.integer :alive

      t.timestamps
    end
  end
end
