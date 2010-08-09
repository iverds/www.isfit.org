class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.datetime :registered_time
      t.datetime :checked_in
      t.datetime :picked_up
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :address1
      t.text :address2
      t.string :zipcode
      t.string :city
      t.belongs_to :country
      t.string :phone
      t.string :email
      t.string :fax
      t.string :nationality
      t.date :birthdate
      t.string :sex
      t.string :university
      t.string :field_of_study
      t.string :org_name
      t.string :org_function
      t.string :hear_about_isfit
      t.string :hear_about_isfit_other
      t.integer :workshop1
      t.integer :workshop2
      t.integer :workshop3
      t.text :essay1
      t.text :essay2
      t.integer :travel_apply
      t.text :travel_essay
      t.string :travel_amount
      t.integer :travel_nosupport_other
      t.integer :travel_nosupport_cancome
      t.integer :participant_grade
      t.text :participant_comment
      t.integer :participant_functionary_id
      t.integer :theme_grade1
      t.integer :theme_grade2
      t.text :theme_comment
      t.integer :theme_functionary_id
      t.string :password
      t.integer :final_workshop
      t.integer :invited
      t.integer :travel_assigned
      t.integer :travel_assigned_amount
      t.text :travel_comment
      t.integer :host_id
      t.datetime :last_login
      t.integer :notified_invitation
      t.integer :notified_travel_support
      t.integer :notified_rejection
      t.integer :notified_no_travel_support
      t.integer :notified_rejection_again
      t.date :arrivel_date
      t.string :arrivel_place
      t.time :arrival_time
      t.string :arrival_carrier
      t.integer :arrival_isfit_trans
      t.string :arrival_airline
      t.string :arrival_flight_number
      t.date :departure_date
      t.time :departure_time
      t.string :departure_carrier
      t.integer :departure_isfit_trans
      t.string :departure_place
      t.integer :notified_custom
      t.datetime :request_travel
      t.integer :accept_travel
      t.datetime :accepted_travel_time
      t.integer :bed
      t.integer :bedding
      t.integer :apecial_invite

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
