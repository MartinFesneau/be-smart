class RemoveBirthdayInPhilosopher < ActiveRecord::Migration[6.0]
  def change
    remove_column :philosophers, :birthday
  end
end
