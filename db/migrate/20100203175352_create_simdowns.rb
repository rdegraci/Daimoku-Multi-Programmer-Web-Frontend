class CreateSimdowns < ActiveRecord::Migration
  def self.up
    create_table :simdowns do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simdowns
  end
end
