class DialogueParticipant < ActiveRecord::Base
	belongs_to :country	

#	validates_presence_of :password, :message => "A password must be supplied."
#	validates_length_of :password, :in => 8..255,
#		:too_short => "Password must be between 8 and 255 characters.",
#		:too_long => "Password must be between 8 and 255 characters."

	#Validate General
	validates_presence_of :first_name, :message => "First name can't be blank"
	validates_presence_of :last_name, :message => "Last name can't be blank"
	validates_presence_of :address1, :message => "Address 1 can't be blank"
	validates_presence_of :zipcode, :message => "ZIP code can't be blank"
	validates_presence_of :city, :message => "City can't be blank"
	validates_inclusion_of :country_id, :in => 1..200, :message => "Country not selected"
	validates_presence_of :phone, :message => "Phone number can't be blank"
	validates_presence_of :nationality, :message => "Nationality can't be blank"
	validates_presence_of :passport, :message => "Nationality can't be blank"
	validates_presence_of :sex,  :message => "Sex must be selected"	
	validates_presence_of :university,  :message => "University can't be blank"
	validates_presence_of :field_of_study,  :message => "Field of study can't be blank"
	#validates_presence_of :workshop1,  :message => "Workshop 1 not selected"
	#validates_presence_of :workshop2,  :message => "Workshop 2 not selected"	
	validates_presence_of :essay1, :message => "Essay 1 can't be blank"
	validates_presence_of :essay2, :message => "Essay 2 can't be blank"
	validates_presence_of :essay3, :message => "Essay 3 can't be blank"
	validates_presence_of :essay4, :message => "Essay 4 can't be blank"
	validates_presence_of :birthdate, :message => "Birth date not valid"
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
      			:message => 'Email must be valid'
	validates_confirmation_of :email, :message => "Email should match confirmation"
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
