
class PagesController < ApplicationController



	def home
	end

	def about
	end

	def jobs
	end

	# def sample
	# end

	def sample



=begin
		base_url = "https://api.23andme.com/1/demo"
		token = "fdab6a6892b198e40c2484bf2121f761"
		headers = {Authorization: "Bearer #{token}"}
=end

		base_url= "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffeeshop+in+11223+&key=AIzaSyAbGKM9_wSmQWSh9th1ezcSFuSxnAo5dJA"
		# need to grab zipcode from user

		response = HTTParty.get(base_url)
		@profiles = response["results"]

		@profiles.each {
			|nom|
			@name = nom["name"]
			
		}


		# set the person's id, first_name, and last_name, to match first profile's id, first_name, and last_name

		# parse data 
		# pick highest ranked location
		# return that location - name, address, hours, etc.

		# pass that back to front end

	end

end
