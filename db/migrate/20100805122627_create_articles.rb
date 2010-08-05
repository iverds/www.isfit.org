class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title_en
      t.string :title_no
      t.text :ingress_en
      t.text :ingress_no
      t.text :body_en
      t.text :body_no
      t.boolean :list
      t.integer :weight
      t.boolean :deleted
      t.boolean :press_release
      t.text :sub_title_en
      t.text :sub_title_no

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
