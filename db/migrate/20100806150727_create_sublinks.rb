class CreateSublinks < ActiveRecord::Migration
  def self.up
    create_table :sublinks do |t|
      t.belongs_to :tab
      t.string :title_en
      t.string :title_no
      t.string :url
      t.string :external_url
      t.integer :order
      t.boolean :deleted
      t.belongs_to :page

      t.timestamps
    end
  end

  def self.down
    drop_table :sublinks
  end
end
