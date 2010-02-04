class CreateSimkeys < ActiveRecord::Migration
  def self.up
    create_table :simkeys do |t|

      t.column :name, :string
      t.column :description, :text

      t.column :simdoor_id, :integer

      t.column :script, :text

      t.column :creatorname, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simkeys
  end
end
