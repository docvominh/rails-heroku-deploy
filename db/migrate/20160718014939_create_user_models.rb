class CreateUserModels < ActiveRecord::Migration
  def change
    create_table :user_models do |t|
      t.string :user_id, limit: 30
      t.string :user_name, limit: 100
      t.string :password_digest, limit: 100
      t.string :password_salt, limit: 100
      t.date :date_of_birth
      t.string :email, limit: 200
      t.string :img_url, limit: 256
      t.string :note

      t.timestamps null: false
    end
  end
end
