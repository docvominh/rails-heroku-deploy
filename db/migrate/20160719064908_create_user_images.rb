class CreateUserImages < ActiveRecord::Migration
  def change
    create_table :user_images do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
