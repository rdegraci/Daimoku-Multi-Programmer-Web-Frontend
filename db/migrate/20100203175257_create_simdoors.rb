class CreateSimdoors < ActiveRecord::Migration
  def self.up
    create_table :simdoors do |t|

      t.column :name, :string
      t.column :description, :text

      t.column :script, :text

      t.column :creatorname, :string

      t.column :locked, :bool


      t.column :simnorth_id, :integer
      t.column :simsouth_id, :integer
      t.column :simeast_id, :integer
      t.column :simwest_id, :integer
      t.column :simup_id, :integer
      t.column :simdown_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simdoors
  end
end
