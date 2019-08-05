class Scraper

 
    def self.scrape_index_page(index_url)	
      doc = Nokogiri::HTML(open(index_ur))
     student_list = []

      doc.css('.student-card').each do |students|
         name = students.css('.student-name').text
         location = students.css('.student-location').text
         profile_url = students.css('a').attribute('href').value
         student = {name: name, location: location, profile_url: profile_url}
         student_list << student
     end
     student_list
   end		   end

 
    def self.scrape_profile_page(profile_url)		   def self.scrape_profile_page(profile_url)

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
   end		   end

 
  end		 end
