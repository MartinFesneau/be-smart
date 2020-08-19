class RenameAvailableLocationToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :philosophers, :available_location, :address
  end
end
