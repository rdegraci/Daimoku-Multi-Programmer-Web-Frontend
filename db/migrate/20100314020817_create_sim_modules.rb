class CreateSimModules < ActiveRecord::Migration
  def self.up
    create_table :sim_modules do |t|
      t.string :name
      t.text :source
      t.text :importscript

      t.timestamps
    end
  end

  def self.down
    drop_table :sim_modules
  end
end
