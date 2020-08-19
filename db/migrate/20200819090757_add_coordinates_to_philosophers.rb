class AddCoordinatesToPhilosophers < ActiveRecord::Migration[6.0]
  def change
    add_column :philosophers, :latitude, :float
    add_column :philosophers, :longitude, :float
  end
end
