class CreateWopPropositions < ActiveRecord::Migration
  def self.up
    create_table :wop_propositions do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :wop_propositions
  end
end
