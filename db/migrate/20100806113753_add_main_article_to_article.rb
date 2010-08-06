class AddMainArticleToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :main_article, :boolean
  end

  def self.down
    remove_column :articles, :main_article
  end
end
