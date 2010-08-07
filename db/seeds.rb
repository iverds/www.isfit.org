# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

tabs = Tab.create([{ :name_en => 'News', :order=> 0, :tag=>'news', :name_no =>'Nyheter'}, { :name_en => 'Apply for ISFiT', :order=> 1, :tag=>'apply', :name_no =>'Søk ISFiT'}, { :name_en => 'About ISFiT', :order=> 2, :tag=>'about', :name_no =>'Om ISFiT'}, { :name_en => 'Global Health', :order=> 3, :tag=>'health', :name_no =>'Global Helse'}, { :name_en => 'Participant', :order=> 4, :tag=>'participant', :name_no =>'Deltager'}, { :name_en => 'The ISFiT-way', :order=> 5, :tag=>'isfitway', :name_no =>'The ISFiT-way'}])


sublinks = Sublink.create([{:tab_id =>1,:title_no=>"Siste Nytt", :title_en=> "Latest news", :order=>0, :deleted=>0, :page_id=>0},{:tab_id =>2, :title_en=> "History", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>3, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>4, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>5, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1},{:tab_id =>6, :title_en=> "A laureate is chosen", :order=>0, :deleted=>0, :page_id=>1}, {:tab_id =>1, :title_no=>"Arkiv", :title_en=>"Archive", :order=>1, :deleted=>0, :page_id=>1}])

pages = Page.create(:title_en=>"THE STUDENT PEACE PRIZE PRESENT AND THE FUTURE", :ingress_en=>"BLABLA", :body_en=>"BLABLABLABLA")

article = Article.create(:title_en=>"This is the title", :ingress_en=>"BLA", :body_en=>"BODY")
