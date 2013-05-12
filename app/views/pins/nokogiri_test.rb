require 'rubygems'
gem 'nokogiri'
require 'open-uri'

url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=batman&Find.x=0&Find.y=0&Find=Find"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text