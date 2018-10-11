class IllinoisColleges::College
  attr_accessor :name, :location, :size, :type, :url
  
  def self.college
    # Will return a bunch of instances of colleges 
    # puts "Colleges and universities in the state of Illinois:"
    self.scrape_colleges
  end
  
  def self.scrape_colleges
    colleges = []
    
    colleges << self.scrape_illinois_index_page
    
    colleges
  end
  
  def self.scrape_illinois_index_page
    doc = Nokogiri::HTML(open("https://www.collegesimply.com/colleges/illinois/"))
    
    # binding.pry
    
    college = self.new
    
    doc.xpath("//tr").each do |doc|
      if doc.css("td")[0] != nil
        college.name = doc.css("td")[0].text.strip
      end
      
      if doc.css("td")[1] != nil
        college.location = doc.css("td")[1].text.strip
      end
      
      if doc.css('table.table tbody tr td:nth-child(1) a')[0] != nil
        college.link = doc.css('table.table tbody tr td:nth-child(1) a')[0]['href']
      end
    end
    college
  end
end