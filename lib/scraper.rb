class Scraper

 
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

 
    def self.scrape_profile_page(profile_url)	

end		 
