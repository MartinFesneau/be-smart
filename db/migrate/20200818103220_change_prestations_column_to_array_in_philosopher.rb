class ChangePrestationsColumnToArrayInPhilosopher < ActiveRecord::Migration[6.0]
  def change
    change_column :philosophers, :prestations, :string, array: true, default: '{}', using: "(string_to_array(prestations, ','))"
  end
end
