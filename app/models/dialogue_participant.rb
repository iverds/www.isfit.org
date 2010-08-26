class DialogueParticipant < ActiveRecord::Base
	belongs_to :country	

#	validates_presence_of :password, :message => "A password must be supplied."
#	validates_length_of :password, :in => 8..255,
#		:too_short => "Password must be between 8 and 255 characters.",
#		:too_long => "Password must be between 8 and 255 characters."

	#Validate General
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :address1
	validates_presence_of :zipcode
	validates_presence_of :city
	validates_inclusion_of :country_id, :in => 1..200, :message => "not selected"
	validates_presence_of :phone
	validates_presence_of :nationality
	validates_presence_of :passport
	validates_presence_of :sex	
	validates_presence_of :university
	validates_presence_of :field_of_study
	#validates_presence_of :workshop1,  :message => "Workshop 1 not selected"
	#validates_presence_of :workshop2,  :message => "Workshop 2 not selected"	
	validates_presence_of :essay1
	validates_presence_of :essay2
	validates_presence_of :essay3
	validates_presence_of :essay4
	validates_presence_of :birthdate
	validates_presence_of :apply_workshop, :message => "Have you applied or will you apply for ISFiT Workshop?"

	#Validate essay-length
	validates_length_of :essay1, :maximum=>2200, :message => "Essay 1 too long"
	validates_length_of :essay2, :maximum=>2200, :message => "Essay 2 too long"
	validates_length_of :essay3, :maximum=>2200, :message => "Essay 3 too long"
	validates_length_of :essay4, :maximum=>1200, :message => "Essay 4 too long"
	validates_length_of :travel_essay, :maximum=>1500, :message => "Travel essay too long"
	
	


	#Validate Email
    validates_format_of :email,
      			:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
      			:message => 'must be valid'
	validates_confirmation_of :email, :message => "should match confirmation"
	validates_uniqueness_of :email, :message => "An application with this email address has already been registered"

	#Validate Self defined
	validate :check_age
	

	#Validate travel support
	validates_presence_of :travel_essay, 
			:if => Proc.new { |n| n.travel_apply > 0 }, 
			:message => "Travel Essay can't be blank "
	validates_presence_of :travel_amount, 
			:if => Proc.new { |n| n.travel_apply > 0 }, 
			:message => "Travel amount can't be blank"
	validates_numericality_of :travel_amount,
			:if => Proc.new { |n| n.travel_apply > 0 },
            :message => "Travel amount must be a number"

	def check_age
      errors.add_to_base("Age should be between 18 and 100") unless birthdate != nil and
				Date.today.year - birthdate.year < 101 && ( 
					 2011 - birthdate.year > 18 or
					(2011 - birthdate.year == 18 && birthdate.month == 1)  or
					(2011 - birthdate.year == 18 && birthdate.month == 2 && birthdate.day < 11))
				
    end
end
