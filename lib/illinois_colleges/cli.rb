# CLI controller

class IllinoisColleges::CLI 
  
  def call
    puts "Colleges and universities in the state of Illinois:"
  end
  
  def list_colleges
    puts <<~DOC
      1. Elmhurst College
      2. Illinois State University
      3. Northwestern University
      4. University of Chicago
      5. University of Illinois
    DOC
  end
end