require 'open-uri'
require 'timeout'

class StaticPagesController < ApplicationController
  def home
  	begin
  		Timeout::timeout(1){
  			result = JSON.parse(open("http://data.cityofnewyork.us/resource/byv3-iir3.json?$limit=1").read)
	 		@street_address = result[0]["incident_address"]
  			@zip_code = result[0]["incident_zip"]
  		}
	rescue Timeout::Error
  		@street_address = "<Time out on NYC Open Data side...>"
  		@zip_code = "<Time out on NYC Open Data side...>"
	end
  end
end