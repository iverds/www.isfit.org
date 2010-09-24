class Participant < ActiveRecord::Base
	belongs_to :country	

	# Constants defining identifiers for 
	# input data from wizard forms (ie. values from radio buttons etc)
	WIZARD_CARRIER_TRAIN	= "train"
	WIZARD_CARRIER_PLANE	= "air"
	WIZARD_CARRIER_OTHER	= "other"
	WIZARD_DATE_18FEB		= "18feb"
	WIZARD_DATE_19FEB		= "19feb"
	WIZARD_DATE_20FEB		= "20feb"
	WIZARD_DATE_OTHER		= "other"
	WIZARD_BUTTON_BACK		= "back"
	WIZARD_BUTTON_FORWARD	= "forward"
	WIZARD_PLACE_TRD		= "trd"
	WIZARD_PLACE_OSL		= "osl"
	WIZARD_PLACE_OTHER		= "otr"
	WIZARD_ISFIT_TRANS_YES	= true
	WIZARD_ISFIT_TRANS_NO	= false

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
  validates_inclusion_of :country_id, :in => 1..201, :message => "not selected"
	validates_presence_of :phone
	validates_presence_of :nationality
	validates_presence_of :sex,  :message => "must be selected"	
	validates_presence_of :university
	validates_presence_of :field_of_study
#	validates_presence_of :workshop1,  :message => "Workshop 1 not selected"
#	validates_presence_of :workshop2,  :message => "Workshop 2 not selected"	
#	validates_presence_of :workshop3,  :message => "Workshop 3 not selected"

	# No longer validated to allow not being fetched from DB and still
	# make model validate ok
	validates_presence_of :essay1
	validates_presence_of :essay2
	validates_length_of :essay1, :maximum=>1900, :message => "Essay 1 too long"
	validates_length_of :essay2, :maximum=>2300, :message => "Essay 2 too long"
	validates_length_of :travel_essay, :maximum=>1500, :message => "Travel essay too long"
	
	validates_presence_of :birthdate, :message => "not valid"

	#Validate WSs
	validates_numericality_of :workshop1,:greater_than => 0, :message => " not selected"
	validates_numericality_of :workshop2,:greater_than => 0, :message => "not selected"
  validates_numericality_of :workshop3,:greater_than => 0, :message => "not selected"


	#Validate Email
  validates_format_of :email,
      			:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
      			:message => 'address is invalid.'
	validates_confirmation_of :email, :message => "address should match confirmation."
	validates_uniqueness_of :email, :message => " address is already in use."

	#Validate birthdate
	#validate :check_birthdate

	#Validate Self defined
	validate :check_age
	validate :check_workshops

	#Validate travel support

	# No longer validated as travel essay is not validated (look above)
	validates_presence_of :travel_essay, 
			:if => Proc.new { |n| n.travel_apply > 0 }
	validates_presence_of :travel_amount, 
			:if => Proc.new { |n| n.travel_apply > 0 }
	validates_numericality_of :travel_amount,
			:if => Proc.new { |n| n.travel_apply > 0 },
            :message => "must be a number"

	# Validate Wizard
	# Step 1
	validates_presence_of :arrival_date,
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 1},
		:message => "Please select when you will arrive in Norway (arrival date)"
	validates_presence_of :arrival_time, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 1},
		:message => "Please specify the time of your arrival in Norway"
	validates_presence_of :arrival_carrier, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 1},
		:message => "Please specify by what means of transport you will arrive in Norway. (Train, Airplane etc.)"
		
	# Step 2
	validates_presence_of :arrival_place, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 2},
		:message => "Please select and / or specify where in Norway you will arrive."
	validates_presence_of :arrival_airline,
		:if => Proc.new {
			|part| (part.respond_to?(:wizard_step) and part.wizard_step == 2 and 
			part.arrival_carrier == WIZARD_CARRIER_PLANE)},
		:message => "Please specify what airline you will arrive with."
	validates_presence_of :arrival_flight_number,
		:if => Proc.new {
			|part| (part.respond_to?(:wizard_step) and part.wizard_step == 2 and 
			part.arrival_carrier == WIZARD_CARRIER_PLANE)},
		:message => "Please specify flight number for the flight you are arriving in Norway with."
	
	# Step 3
	validates_inclusion_of :arrival_isfit_trans, 
		:in => [true, false],
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 3},
		:message => "Please indicate whether you will sign up for the ISFiT transportation or not."

	# Step 4
	validates_presence_of :departure_date, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 4},
		:message => "Please indicate at what date you will depart from Norway."
	validates_presence_of :departure_time, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 4},
		:message => "Please indicate the time when you will leave Norway."
	validates_presence_of :departure_carrier, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 4},
		:message => "Please select what means of transportation you will use when departing from Norway."
		
	# Step 5
	validates_presence_of :departure_place, 
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 5},
		:message => "Please select and / or specify where in Norway you will depart from."
	# Step 6
	validates_inclusion_of :departure_isfit_trans, 
		:in => [true, false],
		:if => Proc.new {|part| part.respond_to?(:wizard_step) and part.wizard_step == 6},
		:message => "Please indicate whether you will sign up for the ISFiT transportation or not."

	def check_age
		errors.add_to_base("Age should be between 18 and 100") unless birthdate != nil and 
		Date.today.year - birthdate.year < 101 && ( 
			2011 - birthdate.year > 18 or
			(2011 - birthdate.year == 18 && birthdate.month == 1)  or
			(2011 - birthdate.year == 18 && birthdate.month == 2 && birthdate.day < 11))
	end

	def check_workshops
		errors.add_to_base("Pleace choose different workshops") unless (workshop1 != workshop2 and workshop2 != workshop3 and workshop1 != workshop3)
	end	
	def is_radio_button_date
		if arrival_date.eql? Date::new(2009, 02, 18) \
			or arrival_date.eql? Date::new(2009, 02, 19) \
			or arrival_date.eql? Date::new(2009, 02, 20)
			return true
		else
			return false
		end
	end
	
	def get_custom_arrival_place
		if arrival_place == Participant::WIZARD_PLACE_TRD or 
			arrival_place == Participant::WIZARD_PLACE_OSL
			return ""
		else
			return arrival_place
		end
	end
	
	def get_custom_departure_place
		if departure_place == Participant::WIZARD_PLACE_TRD or 
			departure_place == Participant::WIZARD_PLACE_OSL
			return ""
		else
			return departure_place
		end
	end
	
	def isfit_arrival_trans?
		# determines if this participant's travel
		# details make him / her qualify for the ISFiT Transportation
		if arrival_place == WIZARD_PLACE_OSL and
			(arrival_date.day < 20 or 
			(arrival_date.day == 20 and arrival_time.hour == 0 and
			arrival_time.min == 0)) and
			arrival_date.month == 2
			return true
		else
			return false
		end
	end
	
	def isfit_departure_trans?
		# determines if this participant's travel
		# details make him / her qualify for the ISFiT Transportation
		if departure_place == WIZARD_PLACE_OSL
			return true
		else
			return false
		end
	end
	
	def self.count_beds
	  connection.select_one("SELECT COUNT(*) AS beds FROM participants WHERE bed=1")["beds"].to_i
	end
	def self.count_beddings
	  connection.select_one("SELECT COUNT(*) AS beddings FROM participants WHERE bedding=1")["beddings"].to_i
	end
end
