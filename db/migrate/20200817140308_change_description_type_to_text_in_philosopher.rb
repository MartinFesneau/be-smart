class ChangeDescriptionTypeToTextInPhilosopher < ActiveRecord::Migration[6.0]
  def change
    change_table :philosophers do |t|
      t.change :description, :text
    end
  end
end
