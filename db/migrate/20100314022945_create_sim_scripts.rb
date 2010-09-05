class CreateSimScripts < ActiveRecord::Migration
  def self.up
    create_table :sim_scripts do |t|
      t.string :name
      t.text :source
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :sim_scripts
  end
end
