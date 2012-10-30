class AddCommentsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :comments
    end
  end
end
