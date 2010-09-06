class AddUserForeignKeys < ActiveRecord::Migration
  def self.up
    add.column :roles, :user_id, :integer
  end

  def self.down
    remove.column :roles, :user_id
  end
end
