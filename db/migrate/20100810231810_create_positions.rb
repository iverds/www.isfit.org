class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title_en
      t.string :title_no
      t.integer :person_id
      t.text :description_en
      t.text :description_no
      t.string :group_dn
      t.integer :admission_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
