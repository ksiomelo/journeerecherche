class AddResponsableToUsers < ActiveRecord::Migration
  def change
     change_table :users do |t|
      t.string :responsable
    end
  end
end
