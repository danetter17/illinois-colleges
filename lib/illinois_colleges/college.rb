class College
  attr_accessor :name, :location, :size, :type, :url
  BASE_PATH = "https://www.collegesimply.com/colleges/illinois/"
  
  def self.college
    # Will return a bunch of instances of colleges 
    # puts "Colleges and universities in the state of Illinois:"
    self.scrape_colleges
  end
  
  def self.scrape_colleges
    colleges = self.scrape_illinois_index_page
    
    colleges
  end
  
  def self.scrape_illinois_index_page
    doc = Nokogiri::HTML(open(BASE_PATH))
    
    # binding.pry
    
    colleges = []
    
    doc.xpath("//tr").each do |doc|
      college = self.new
      if doc.css("td")[0] != nil
        college.name = doc.css("td")[0].text.strip
      end
      
      if doc.css("td")[1] != nil
        college.location = doc.css("td")[1].text.strip
      end
      
      if doc.css('table.table tbody tr td:nth-child(1) a')[0] != nil
        college.url = doc.css('table.table tbody tr td:nth-child(1) a')[0]['href']
      end
      colleges << college
    end
    colleges
  end
end
