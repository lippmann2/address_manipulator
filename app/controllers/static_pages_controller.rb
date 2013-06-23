require 'open-uri'

class StaticPagesController < ApplicationController
  def home
  	#@some_html = "test"
  	result = JSON.parse(open("http://data.cityofnewyork.us/resource/tj4w-skrs.json?$limit=2").read)
  	@some_html = result
  end

end
