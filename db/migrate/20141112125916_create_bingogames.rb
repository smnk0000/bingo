class CreateBingogames < ActiveRecord::Migration
  def change
    create_table :bingogames do |t|
      t.integer :num, :default => 0, :null => false
      t.boolean :flg, :default => false, :null => false
      t.timestamps
    end
  end
end
