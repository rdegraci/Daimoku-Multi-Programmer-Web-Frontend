class CreateSimnorths < ActiveRecord::Migration
  def self.up
    create_table :simnorths do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simnorths
  end
end
