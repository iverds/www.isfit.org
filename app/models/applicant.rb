class Applicant < ActiveRecord::Base
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_format_of :mail, 
  :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  :message => "The supplied e-mail address is no valid"
  validates_format_of :phone, :with => /^\d{8}$/,	
  :message => "number must consist of exactly 8 digits"
  validates_presence_of :information, 
  :message => "about you is missing"
  validates_presence_of :background, 
  :message => "is missing"
  validates_numericality_of :position_id_1, :greater_than => 0, 
  :message => "At least one position must be selected"


  def self.validate_field(field, value)
    validity = Applicant.new(field => value)
    validity.valid?
    if validity.errors.on field
      ajaxResponse = {:valid => false, field.to_sym => validity.errors[:field]}
    else
      ajaxResponse = {:valid => true}
    end
  end
end
