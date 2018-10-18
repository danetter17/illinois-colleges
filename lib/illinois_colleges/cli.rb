# CLI controller

class CLI 
  
  def call
    list_colleges
    menu
    goodbye
  end
  
  def list_colleges
    puts "Colleges and universities in the state of Illinois:"
    @colleges = College.college
    @colleges.each.with_index(1) {|college, i|
      puts "#{i}. #{college.name} - #{college.location}"}
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the institution that you would like more information on, type 'list' to list the institutions again, or type 'exit':"
      input = gets.strip.downcase
      
      if input.to_i > 0 
        the_college = @colleges[input.to_i - 1]
        puts "#{the_college.name} - #{the_college.location} - #{the_college.size}"
      elsif input == "list"
        list_colleges
      else
        puts "Not sure what you meant, please type 'list' or 'exit'.."
      end
    end
  end
  
  def goodbye
    puts "Come back anytime to learn more about the colleges and universities in the state of Illinois!"
  end