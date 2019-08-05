require 'pry'
class Scraper
  attr_accessor :name, :location, :profile_url

  students = []
  
  def self.scrape_index_page(index_url)
     doc = Nokogiri::HTML(open(index_url))
     student_list = []

      doc.css('.student-card').each do |students|
         name = students.css('.student-name').text
         location = students.css('.student-location').text
         profile_url = students.css('a').attribute('href').value
         student = {name: name, location: location, profile_url: profile_url}
         student_list << student
       end
     student_list
   end
   
   def self.scrape_profile_page(profile_url)
     student_profile = Nokogiri::HTML(open(profile_url))
     attributes_hash = {}

      social = student_profile.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
     social.each do |link|
       if link.include?("twitter")
         attributes_hash[:twitter] = link
       elsif link.include?("linkedin")
         attributes_hash[:linkedin] = link
       elsif link.include?("github")
         attributes_hash[:github] = link
       elsif link.include?(".com")
         attributes_hash[:blog] = link
       end
     end
     attributes_hash[:profile_quote] = student_profile.css("div.profile-quote").text
     attributes_hash[:bio] = student_profile.css("div.description-holder p").text
     attributes_hash
   end 
 end 
   