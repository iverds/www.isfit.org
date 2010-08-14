class AddPublishedToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :published, :boolean
  end

  def self.down
    remove_column :articles, :published
  end
end
