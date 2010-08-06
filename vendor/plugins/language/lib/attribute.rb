class << ActiveRecord::Base
	def lang_attr(*symbols)
		symbols.each do |symbol|
			class_eval %{
				def #{symbol}
					if Language.to_s == 'en'
						#{symbol}_en
					else
						#{symbol}_no
					end
				end
			}
		end
	end
end
