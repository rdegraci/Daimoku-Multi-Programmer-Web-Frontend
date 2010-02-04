class CreateSimplaces < ActiveRecord::Migration
  def self.up
    create_table :simplaces do |t|

      t.column :name, :string
      t.column :description, :text
      t.column :script, :text

      t.column :simmap_id, :integer

      t.column :creatorname, :string #name of the creator

      t.column :southsimplace_id, :integer  #Place to Place
      t.column :northsimplace_id, :integer
      t.column :westsimplace_id, :integer
      t.column :eastsimplace_id, :integer
      t.column :upsimplace_id, :integer
      t.column :downsimplace_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simplaces
  end
end
