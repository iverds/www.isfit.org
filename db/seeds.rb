# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

tabs = Tab.create([{ :name_en => 'News', :order=> 0, :tag=>'news', :name_no =>'Nyheter'}, { :name_en => 'Apply for ISFiT', :order=> 1, :tag=>'apply', :name_no =>'Søk ISFiT'}, { :name_en => 'About ISFiT', :order=> 2, :tag=>'about', :name_no =>'Om ISFiT'}, { :name_en => 'Global Health', :order=> 3, :tag=>'health', :name_no =>'Global Helse'}, { :name_en => 'Participant', :order=> 4, :tag=>'participant', :name_no =>'Deltager'}, { :name_en => 'The ISFiT-way', :order=> 5, :tag=>'isfitway', :name_no =>'The ISFiT-way'}])


sublinks = Sublink.create([{:tab_id =>1,:title_no=>"Siste Nytt", :title_en=> "Latest news", :order=>0, :deleted=>0, :page_id=>0},{:tab_id =>2, :title_en=> "Apply Here", :order=>0, :deleted=>0, :page_id=>0, :url=>"positions#apply"},{:tab_id =>3, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>4, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>5, :title_en=> "Apply for ISFiT", :order=>0, :deleted=>0, :page_id=>0, :url=>"participants#new"},{:tab_id =>6, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1}, {:tab_id =>1, :title_no=>"Arkiv", :title_en=>"Archive", :order=>1, :deleted=>0, :page_id=>1}])

pages = Page.create(:title_en=>"THE STUDENT PEACE PRIZE PRESENT AND THE FUTURE", :ingress_en=>"BLABLA", :body_en=>"BLABLABLABLA")

article = Article.create(:title_en=>"JA til \"Walk of Peace\"", :ingress_en=>"Tirsdag 27. juli vedtok Trondheim Kommune å lage en Walk of Peace i Jomfrugata i Trondheim sentrum, etter initiativ fra ISFiT.", :body_en=>"Hollywood har lenge hatt sin Walk of Fame, men i Trondheims versjon av utmerkelsen er det vinnere av Studentenes Fredspris som skal prege bybildet. Hollywood Boulevard preges av stjerner nedfelt i bakken, hvordan det vil bli seende ut i Trondheim er fortsatt uklart, men det vil bli bestemt etter en utformingskonkurranse blant studenter.

Den nye ”Walk of Peace” vil bidra til økt synlighet og oppmerksomhet rundt vinnerne av Studentenes Fredspris og saken de kjemper for. Det vil også gi ekstra oppmerksomhet rundt det at Trondheim er den eneste byen i verden som deler ut en fredspris for studenter. Studentenes fredspris deles ut annet hvert år under ISFiT, på vegne av alle studenter i Norge.

Finansieringen til \"Walk of Peace\" vil hovedsaklig komme fra ISFiT-festivalen. I 2010 er det 20 år siden første gang ISFiT ble arrangert, og Walk of Peace er en fin måte for studentene å gi noe tilbake til byen.

ISFiT-president Kine Karlsen sier til NRK at hun er svært fornøyd med kommunens avgjørelse. Les hele saken her")

countries = Country.create(:name=>"Afghanistan", :region_id=>"5")

sections = Section.create([{:name_no=>"Administration", :name_en=>"Administration"}, {:name_no=>"Culture", :name_en=>"Kultur"}])


