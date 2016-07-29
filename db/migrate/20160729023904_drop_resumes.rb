class DropResumes < ActiveRecord::Migration
  def up
    drop_table :resumes
  end
end
