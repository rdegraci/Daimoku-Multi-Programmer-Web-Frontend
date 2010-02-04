class CreateSimplayers < ActiveRecord::Migration
  def self.up
    create_table :simplayers do |t|

      t.column :name, :text
      t.column :password, :text
      t.column :email, :text
      t.column :sessionid, :text
      t.column :online, :boolean  #true if logged in
      
      t.timestamps
    end
  end

  def self.down
    drop_table :simplayers
  end
end
