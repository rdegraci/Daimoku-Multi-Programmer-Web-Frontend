class CreateSimeasts < ActiveRecord::Migration
  def self.up
    create_table :simeasts do |t|
      t.column :simplace_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :simeasts
  end
end
