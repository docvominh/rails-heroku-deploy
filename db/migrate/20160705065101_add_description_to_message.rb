class AddDescriptionToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :description, :string
  end
end
