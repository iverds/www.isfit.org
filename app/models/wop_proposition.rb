class WopProposition < ActiveRecord::Base
validates_presence_of :firstname
validates_presence_of :lastname
validates_presence_of :address
validates_presence_of :zipcode
validates_presence_of :email
validates_presence_of :phone
validates_presence_of :study_place
validates_presence_of :description


validates_format_of :email,
                    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                    :message => "er ikke gyldig"

validates_format_of :phone, 
                    :with => /^\d{8}$/,
                    :message => "må bestå av nøyaktig 8 siffre"


end
