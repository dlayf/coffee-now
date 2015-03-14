class PagesController < ApplicationController



	def home
	end

	def about
	end

	def jobs
	end

	def sample

		@zipcode = params[:Zipcode]


		base_url= "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffeeshop+in+"
		token_key = "AIzaSyAbGKM9_wSmQWSh9th1ezcSFuSxnAo5dJA"
		# need to grab zipcode from user
		
		if !@zipcode.nil? 
			gon.url = request_url = base_url + @zipcode.to_s + "+&key=" + token_key
			response = HTTParty.get(request_url)



				@profiles = response["results"]
				
				#sets the initial winning rating to zero
				win_rating = 0.0
				win_place_id = ""
				win_name = win_address = win_rating = win_phone = ""


				@profiles.each do |profile|


					unless(profile["name"] == "Starbucks" || profile["name"] == "Dunkin' Donuts" || profile["name"] == "McDonalds")


						if profile["rating"].to_f > win_rating.to_f
							win_place_id = 	profile["place_id"] 
						end
						
					end	

					win_place_url = win_place_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + win_place_id + "&key=" + token_key

					gon.win_place_url = win_place_url
					
					#fetch winning location details
					place_response = HTTParty.get(win_place_url)
					winner = place_response["result"]


						gon.win_name = win_name = winner["name"]
						gon.win_address= win_address = winner["formatted_address"]
						gon.win_rating = win_rating = winner["rating"]
						gon.win_phone = win_phone = winner["formatted_phone_number"]
						
						
					
=begin
			win_photo_reference = winner["photos"][0]["photo_reference"]
			win_photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + win_photo_reference + "&key=" + token_key
			gon.win_photo = win_photo = HTTParty.get(win_photo_url)
=end				
				
			

			end
		end
	end

# PLACE ID SEARCH:
# https://maps.googleapis.com/maps/api/place/details/json?placeid=[PLACE_ID]&key=[API_KEY]

# PHOTO REFERENCE:
#https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=[REF_NUMBER]&key=AddYourOwnKeyHere
#CnRnAAAAKxJP-v7sAcvn7Xi435tUZYZG2eAZlIrEAzgn-H60cDN2kOjdDTxQbwUkrUOICPCTXx-Pv2pqiunM3xQBlFHe7S2lBN8Gwo66oaqNvTQXCBRHV2Dyq5WVXu2jE-wJODe1bxIP9fQVhUU_G57cSbr4lBIQKjJoSUFsExGAW7ABNwXr1BoU0uTlqbRy60ZKwMwj8jVb2OXHKHg
	
	

	
end
