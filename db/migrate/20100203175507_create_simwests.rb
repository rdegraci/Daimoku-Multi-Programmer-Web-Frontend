class CreateSimwests < ActiveRecord::Migration
  def self.up
    create_table :simwests do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simwests
  end
end
