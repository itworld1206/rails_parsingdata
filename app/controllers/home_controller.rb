require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
    @titles = Title.all
  end
  
  def title_save
    654931.downto(654928) do |c|
      doc = Nokogiri::HTML(open("http://www.slrclub.com/bbs/zboard.php?id=free&page=#{c}"))
      doc.css(".sbj").each do |x|
        t = Title.new
        t.title = x.inner_text
        t.save
      end
    end
    
    redirect_to '/'
  end
end
