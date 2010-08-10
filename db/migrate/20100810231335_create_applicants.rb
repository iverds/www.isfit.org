class CreateApplicants < ActiveRecord::Migration
  def self.up
    create_table :applicants do |t|
      t.string :firstname
      t.string :lastname
      t.string :mail
      t.integer :phone
      t.text :information
      t.text :background
      t.integer :position_id_1
      t.integer :position_id_2
      t.integer :position_id_3
      t.text :heardof
      t.integer :status
      t.string :interview_place_1
      t.string :interview_place_2
      t.string :interview_place_3
      t.datetime :interview_time_1
      t.datetime :interview_time_2
      t.datetime :interview_time_2
      t.datetime :interview_time_3
      t.integer :interviewer_id_1_1
      t.integer :interviewer_id_1_2
      t.integer :interviewer_id_2_1
      t.integer :interviewer_id_2_2
      t.integer :interviewer_id_3_1
      t.integer :interviewer_id_3_2
      t.integer :deleted
      t.string :username
      t.string :password
      t.string :dn
      t.integer :has_account
      t.integer :is_notified

      t.timestamps
    end
  end

  def self.down
    drop_table :applicants
  end
end
