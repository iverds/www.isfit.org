class CreateIsfitMediaLinks < ActiveRecord::Migration
  def self.up
    create_table :isfit_media_links do |t|
      t.string :link
      t.string :short_desc_no
      t.string :long_desc_no
      t.string :short_desc_en
      t.string :long_desc_en

      t.timestamps
    end
  end

  def self.down
    drop_table :isfit_media_links
  end
end
