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
    doc.xpath("//tr").each do |x|
      name = x.css("td")[0].text.strip
      location = x.css("td")[1].text.strip
    binding.pry 

    end
  end
end