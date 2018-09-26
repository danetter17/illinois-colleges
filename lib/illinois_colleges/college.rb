class IllinoisColleges::College
  attr_accessor :name, :location, :size, :type, :url
  
  def self.college
    # Will return a bunch of instances of colleges 
    # puts "Colleges and universities in the state of Illinois:"
    # puts <<~DOC
    #   1. Elmhurst College
    #   2. Illinois State University
    #   3. Northwestern University
    #   4. University of Chicago
    #   5. University of Illinois
    # DOC
    
    college_1 = self.new 
    college_1.name = "Elmhurst College"
    college_1.location = "Elmhurst, Illinois"
    college_1.size = "3403"
    college_1.type = "Private 4 Year"
    college_1.url = "https://www.collegesimply.com/colleges/illinois/elmhurst-college/"
    
    college_2 = self.new 
    college_2.name = "Illinois State University"
    college_2.location = "Normal, Illinois"
    college_2.size = "21039"
    college_2.type = "Public 4 Year"
    college_2.url = "https://www.collegesimply.com/colleges/illinois/illinois-state-university/"
  
    [college_1, college_2]
  end
  
end