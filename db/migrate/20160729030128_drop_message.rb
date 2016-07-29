class DropMessage < ActiveRecord::Migration
  def up
    drop_table :messages
  end
end
