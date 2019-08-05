class Scraper 
  def self.scrape_index_page(index_url)
  doc = Nokogiri::HTML(open(index_url))
     students = doc.css("div.student-card").collect do |student|
       {
         :name => student.search("h4.student-name")[0].text,
         :location => student.search("p.student-location")[0].text,
         :profile_url => student.search("a")[0]["href"]
       } 
     end 
   end 
   