class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
    t.string :email
    t.string :first_name
    t.string :last_name
    t.integer :status
    t.boolean :centrale, :default => true
    t.boolean :wants_to_present, :default => true
    t.string :telephone
    t.has_attached_file :avatar
    t.has_attached_file :cv

      t.integer :laboratory
      t.date :birthday
      t.timestamps
    end
  end
end
