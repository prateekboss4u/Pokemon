class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :total_pokemon
      t.integer :victory

      t.timestamps
    end
  end
end
