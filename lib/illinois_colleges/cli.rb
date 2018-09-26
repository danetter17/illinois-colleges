# CLI controller

class IllinoisColleges::CLI 
  
  def call
    list_colleges
    menu
    goodbye
  end
  
  def list_colleges
    # puts "Colleges and universities in the state of Illinois:"
    # puts <<~DOC
    #   1. Elmhurst College
    #   2. Illinois State University
    #   3. Northwestern University
    #   4. University of Chicago
    #   5. University of Illinois
    # DOC
    
    @colleges = IllinoisColleges::College.college
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the institution that you would like more information on, type 'list' to list the institutions again, or type 'exit':"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on Elmhurst College..."
      when "2"
        puts "More info on Illinois State University..."
      when "3"
        puts "More info on Northwester University..."
      when "4"
        puts "More info on the University of Chicago..."
      when "5"
        puts "More info on the University of Illinois..."
      when "list"
        list_colleges
      else
        puts "Not sure what you meant, please type 'list' or 'exit'.."
      end
    end
  end
  
  def goodbye
    puts "Come back anytime to learn more about the colleges and universities in the state of Illinois!"
  end
end