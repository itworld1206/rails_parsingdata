require 'nokogiri'
require 'open-uri'

654931.downto(654928) do |c|
  doc = Nokogiri::HTML(open("http://www.slrclub.com/bbs/zboard.php?id=free&page=#{c}"))
  doc.css(".sbj").each do |x|
    puts x.inner_text
  end
end