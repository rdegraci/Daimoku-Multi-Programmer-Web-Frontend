class CreateSimpeople < ActiveRecord::Migration
  def self.up
    create_table :simpeople do |t|

      t.column :uniqueid, :text     #identity

      t.column :script, :text        #run by the Simulation every 10 minutes

      t.column :simplace_id, :integer
      t.column :simcharacter_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simpeople
  end
end
