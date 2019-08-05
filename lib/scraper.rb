require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  attr_accessor :name, :location, :profile_url

  students = []
  
  def self.scrape_index_page(profile_url)
     
   
   def self.scrape_profile_page(profile_url)
     doc = Nokogiri::HTML(open(profile_url))
     student = {}

     hash = doc.css(".social-icon-container a").map {|data| data.attribute("href").value}

        hash.each do |link|
         if link.include?("twitter")
           student[:twitter] = link
         elsif link.include?("linkedin")
           student[:linkedin] = link
         elsif link.include?("github")
           student[:github] = link
         else
           student[:blog] = link
         end
       end

        student[:bio] = doc.css('.description-holder p').text
       student[:profile_quote] = doc.css('.profile-quote').text
     student
   end 
 end