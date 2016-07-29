class AddRoleIdToUserModel < ActiveRecord::Migration
  def change
    add_column :user_models, :role_id, :integer
  end
end
