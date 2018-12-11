class Scraper
  BASE_PATH = "https://www.collegesimply.com"


  def self.scrape_colleges
    doc = Nokogiri::HTML(open("https://www.collegesimply.com/colleges/illinois/"))

    colleges = []
    
    doc.xpath("//tr").drop(1).each do |college_doc|
      college = College.new
      if college_doc.css("td")[0] != nil
        college.name = college_doc.css("td")[0].text.strip
      end
      if college_doc.css("td")[1] != nil
        college.location = college_doc.css("td")[1].text.strip
      end
      if college_doc.css('td')[0].css('a').attr('href') != nil
        college.url = college_doc.css('td')[0].css('a').attr('href')
      end
      colleges << college
    end
  end

  def self.scrape_college_detail(college)
    details = {}
    puts 'Scraping College'
    doc = Nokogiri::HTML(open(BASE_PATH + college.url))
    td_array = doc.xpath("//td")
    td_array.each_with_index do |td, i|
      if td.text == "School Type"
        details[:type] = td_array[i + 1].text
      end
      if td.text == "Size"
        details[:size] = td_array[i + 1].text
      end
      if td.text == "Profit Status"
        details[:profit_status] = td_array[i + 1].text
      end
      if td.text == "Degrees Offered"
        details[:degrees_offered] = td_array[i + 1].text
      end
    end
    details
  end

end
