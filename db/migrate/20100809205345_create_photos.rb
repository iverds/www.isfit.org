class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :image_text_en
      t.string :image_text_no
      t.string :description
      t.string :credits
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
