class AddBylineToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :byline, :string
  end

  def self.down
    remove_column :articles, :byline
  end
end
