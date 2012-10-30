class CreateAreaUser < ActiveRecord::Migration
  def up
    create_table :areas_inscriptions do |t|
      t.integer :area_id
      t.integer :inscription_id

      t.timestamps
    end
  end

  def down
  end
end
