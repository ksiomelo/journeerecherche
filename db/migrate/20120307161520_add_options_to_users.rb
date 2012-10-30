class AddOptionsToUsers < ActiveRecord::Migration
  def change
    
    change_table :users do |t|
      t.string :name
      t.string :tagline
      t.string :domain
      t.boolean :wants_to_interview
      t.has_attached_file :logo
    end
    
    
  end
end
