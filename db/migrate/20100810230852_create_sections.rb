class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name_no
      t.string :name_en

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
