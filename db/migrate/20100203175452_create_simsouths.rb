class CreateSimsouths < ActiveRecord::Migration
  def self.up
    create_table :simsouths do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simsouths
  end
end
