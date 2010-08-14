class AddWeightToChronicle < ActiveRecord::Migration
  def self.up
    add_column :chronicles, :weight, :integer
  end

  def self.down
    remove_column :chronicles, :weight
  end
end
