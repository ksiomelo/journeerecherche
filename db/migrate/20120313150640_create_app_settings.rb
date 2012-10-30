class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.boolean :enterprise_register, :default => true
      t.boolean :enterprise_login, :default => true
      t.boolean :student_register, :default => true
      t.timestamps
    end
  end
end
