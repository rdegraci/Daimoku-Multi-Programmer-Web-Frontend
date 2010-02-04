class CreateSimmaps < ActiveRecord::Migration
  def self.up
    create_table :simmaps do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :simmaps
  end
end
