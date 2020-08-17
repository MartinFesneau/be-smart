class CreatePhilosophers < ActiveRecord::Migration[6.0]
  def change
    create_table :philosophers do |t|
      t.string :nationality
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :specialty
      t.string :available_location
      t.string :prestations
      t.integer :price_per_night
      t.string :description

      t.timestamps
    end
  end
end
