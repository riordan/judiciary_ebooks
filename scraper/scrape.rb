require 'nokogiri'
require 'open-uri'
require 'uri'

idx = "http://www.law.cornell.edu/supct/party.php?party=1&begin=19900101&end=20160101"

def scrape(url)
  n = Nokogiri::HTML(open(url)).at_css("casecontent")
  n.to_s
end

def get_docket(url)
  u = URI(url)
  u.path.split('/')[3]
end


Nokogiri::HTML(open(idx)).css("ul li a").each do |c|
  if c[:href].include?("/supremecourt/text")
    File.open("../html/#{get_docket(c[:href])}.html", 'w') {|f| f.write(scrape("http://www.law.cornell.edu" + c[:href])) }
  else
    next
  end
end

