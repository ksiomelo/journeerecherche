class AddModerationToUsersInscriptions < ActiveRecord::Migration
  def self.up
    add_column :users, :approved, :boolean, :default => false
    add_column :inscriptions, :approved, :boolean, :default => false
  end

  def self.down
  end
end
