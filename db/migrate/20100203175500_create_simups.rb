class CreateSimups < ActiveRecord::Migration
  def self.up
    create_table :simups do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simups
  end
end
