class AddParticipationToUsers < ActiveRecord::Migration
 def change
    
    change_table :users do |t|
      t.boolean :lunch, :default => false
      t.integer :participants, :default => 1
    end
  end
end
