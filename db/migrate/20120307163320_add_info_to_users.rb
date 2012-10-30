class AddInfoToUsers < ActiveRecord::Migration
  def change
    
    change_table :users do |t|
      t.string :website
        t.string :telephone
    end
  end
end
