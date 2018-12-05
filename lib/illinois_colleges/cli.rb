# CLI controller

class CLI

  def call
    Scraper.scrape_colleges if @colleges == nil
    welcome
  end

  def welcome
    input = nil
    while input != "exit"
      puts "Welcome, to see a list of colleges and universities in the state of Illinois type 'list', or type 'exit' to exit the program:"
      input = gets.strip.downcase

      if input == "list"
        list_colleges
        menu
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you meant, please type 'list' or 'exit'.."
      end
    end
  end

  def list_colleges
    puts "Colleges and universities in the state of Illinois:"
    @colleges = College.all
    @colleges.each_with_index do |college, i|
      puts "#{i + 1}. #{college.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the institution that you would like more information on, type 'list' to list the institutions again, or type 'exit':"
      input = gets.strip.downcase

      #This is where I scrape, only if I haven't already scraped the college. If I have, just return the details

      if input.to_i > 0 && input.to_i <= @colleges.length #Checked if it was too small, but need to check if it is too big
        the_college = @colleges[input.to_i - 1]
        the_college.details ||= Scraper.scrape_college_detail(the_college) 
        puts "#{the_college.name} - #{the_college.location}"
        puts "Type: #{the_college.details[:type]}"
        puts "Size: #{the_college.details[:size]}"
        puts "Profit-status: #{the_college.details[:profit_status]}"
        puts "Degrees Offered: #{the_college.details[:degrees_offered]}"
      elsif input == "list"
        list_colleges
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you meant, please type 'list' or 'exit'.."
      end
    end
  end

  def goodbye
    puts "Come back anytime to learn more about the colleges and universities in the state of Illinois!"
  end
end
