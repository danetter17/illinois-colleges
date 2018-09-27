class IllinoisColleges::College
  attr_accessor :name, :location, :size, :type, :url
  
  def self.college
    # Will return a bunch of instances of colleges 
    # puts "Colleges and universities in the state of Illinois:"
    self.scrape_colleges
  end
  
  def self.scrape_colleges
    colleges = []
    
    colleges
  end
  
end