class CreateRoleModels < ActiveRecord::Migration
  def change
    create_table :role_models do |t|
      t.integer :role_id
      t.string :role_name

      t.timestamps null: false
    end
  end
end
