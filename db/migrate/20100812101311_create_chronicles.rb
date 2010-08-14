class CreateChronicles < ActiveRecord::Migration
  def self.up
    create_table :chronicles do |t|
      t.string :title_en
      t.string :title_no
      t.text :ingress_en
      t.text :ingress_no
      t.text :body_en
      t.text :body_no
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :chronicles
  end
end
