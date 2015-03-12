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

		base_url= "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffeeshop+in+"
		token_key = "AIzaSyAbGKM9_wSmQWSh9th1ezcSFuSxnAo5dJA"
		# need to grab zipcode from user
		request_url = base_url + "11223" + "+&key=" + token_key
		response = HTTParty.get(request_url)
		@profiles = response["results"]

		#sets the initial winning ration to zero
		@win_rating = 0.0

		gon.win_rating = @win_rating

		@profiles.each do |profile|

				 
				is_closed = !profile["opening_hours"]["open_now"] 


			
				gon.stat = "got a match"

				if profile["rating"].to_f > @win_rating




					@win_place_id = profile["place_id"]
				end
			




			@win_rating = profile["rating"].to_f 
			@win_name = profile["name"]
			@win_address = profile["formatted_address"] 


			gon.win_place_id = @win_place_id
			gon.win_name = @win_name
			gon.win_address= @win_address
			gon.win_rating = @win_rating

			gon.win_place_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + @win_place_id + "&key=" + token_key
			
		end




# PLACE ID SEARCH:


# https://maps.googleapis.com/maps/api/place/details/json?placeid=[PLACE_ID]&key=[API_KEY]





			

		# set the person's id, first_name, and last_name, to match first profile's id, first_name, and last_name

		# parse data 
		# pick highest ranked location
		# return that location - name, address, hours, etc.

		# pass that back to front end
			

	end

end
