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


namespace :ebook do
  task :scrape do
    Nokogiri::HTML(open(idx)).css("ul li a").first(10).each do |c|
      if c[:href].include?("/supremecourt/text")
        begin
          `mkdir html/#{get_docket(c[:href])}`
          File.open("html/#{get_docket(c[:href])}/#{get_docket(c[:href])}.html", "w:UTF-8") {|f| f.write(scrape("http://www.law.cornell.edu" + c[:href])) }
          `cp metadata_template.xml html/#{get_docket(c[:href])}/metadata.xml`
          `echo "<dc:title>#{get_docket(c[:href])}</dc:title>" >> html/#{get_docket(c[:href])}/metadata.xml`
          `echo '% #{get_docket(c[:href])} \n% Supreme Court of the United States' > html/#{get_docket(c[:href])}/title.txt`
          `pandoc -o epub/#{get_docket(c[:href])}.epub html/#{get_docket(c[:href])}/title.txt html/#{get_docket(c[:href])}/#{get_docket(c[:href])}.html --epub-metadata=html/#{get_docket(c[:href])}/metadata.xml --epub-stylesheet=stylesheet.css --epub-cover-image=cover.jpg`
        rescue
          puts "Unable to do docket #{get_docket(c[:href])}!"
        end
      else
        next
      end
    end
  end
end