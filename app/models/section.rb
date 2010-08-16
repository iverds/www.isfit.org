class Section < ActiveRecord::Base
  lang_attr :name	
  has_many :groups

	def self.getAll(language)
		find(:all, :order => "name_#{language} asc")
	end

	def getPositions(language)
		Position.find(:all, 
			:conditions => "section_id = #{self.id} AND deleted = 0 AND admission_id=1 AND
			NOT title_#{language} IS NULL",
			:order => "title_en asc")
	end
	#Kan velge hvilke opptak
	def getPositions2(language,nr)
		Position.find(:all, :conditons =>"section_id = #{self.id}  AND deleted = 0 AND NOT title_#{language} IS NULL AND opptaknr = #{nr}", :order => "weight asc, title_en asc")
	end

end
