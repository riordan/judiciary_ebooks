require 'nokogiri'
require 'open-uri'
require 'uri'

idx = "http://www.law.cornell.edu/supct/party.php?party=1&begin=19900101&end=20160101"

def scrape(url)
  n = Nokogiri::HTML(open(url))
  n.encoding = 'utf-8'
  casecontent = n.at_css("casecontent")
  title = n.at_css("h1.title")
  result = <<-eos
#{title}
#{casecontent}
  eos
  result
end

def get_docket(url)
  u = URI(url)
  u.path.split('/')[3]
end


Nokogiri::HTML(open(idx)).css("ul li a").each do |c|
  if c[:href].include?("/supremecourt/text")
    begin
      File.open("../html/#{get_docket(c[:href])}.html", "w:UTF-8") {|f| f.write(scrape("http://www.law.cornell.edu" + c[:href])) }
    rescue
      puts "Unable to do docket #{get_docket(c[:href])}!"
    end
  else
    next
  end
end

