class AddSimResourcesToUser < ActiveRecord::Migration
  def self.up
    add_column :sim_klasses, :user_id, :integer
    add_column :sim_modules, :user_id, :integer
    add_column :sim_variables, :user_id, :integer
    add_column :sim_scripts, :user_id, :integer 
  end

  def self.down
    remove_column :sim_klasses, :user_id
    remove_column :sim_modules, :user_id
    remove_column :sim_variables, :user_id
    remove_column :sim_scripts, :user_id
  end
end
