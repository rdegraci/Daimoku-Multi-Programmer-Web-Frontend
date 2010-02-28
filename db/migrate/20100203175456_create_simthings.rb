class CreateSimthings < ActiveRecord::Migration
  def self.up
    create_table :simthings do |t|

      t.column :name, :string
      t.column :description, :text
      t.column :script, :text

      t.column :simperson_id, :integer
      t.column :simplace_id, :integer

      t.column :creatorname, :string	#name of the creator
      t.column :uniqueid, :string	#unique identifier

      t.column :strength, :integer	#0 means destroyable, 100 means indestructible
      t.column :wieght, :integer	#0 means no wieght

      t.column :portable, :boolean
      t.column :visible, :boolean
      t.column :container, :boolean
      t.column :platform, :boolean
      t.column :clothing, :boolean
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simthings
  end
end
