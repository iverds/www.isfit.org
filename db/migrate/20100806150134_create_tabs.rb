class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.string :name_en
      t.string :name_no
      t.string :tag
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
