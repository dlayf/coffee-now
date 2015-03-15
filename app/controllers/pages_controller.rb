class PagesController < ApplicationController



	def home
	end

	def about
	end

	def jobs
	end

	def sample

		#grabs zipcode from form
		@zipcode = params[:enter_zip]

		base_url= "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffeeshop+in+"
		token_key = "AIzaSyAbGKM9_wSmQWSh9th1ezcSFuSxnAo5dJA"

		gon.url = request_url = base_url + @zipcode.to_s + "+&key=" + token_key
		gon.win_photo_url = "http://i.imgur.com/KPrMqR8.jpg"
		gon.win_name = win_name = "Perfect Codecademy Coffee"
		gon.win_address= win_address = "49 West 27th St, New York, NY, 10001"
		gon.win_rating = win_rating = "5.0"




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
							gon.win_name = win_name = profile["name"]
							gon.win_address= win_address = profile["formatted_address"]
							gon.win_rating = win_rating = profile["rating"]

							win_photo_reference = profile["photos"][0]["photo_reference"]
							gon.win_photo_url = win_photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + win_photo_reference + "&key=" + token_key
						end
						
					end						
					
				end
			end
		
	end
	
end

# PLACE ID SEARCH:
# https://maps.googleapis.com/maps/api/place/details/json?placeid=[PLACE_ID]&key=[API_KEY]

# PHOTO REFERENCE:
#https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=[REF_NUMBER]&key=AddYourOwnKeyHere
#CnRnAAAAKxJP-v7sAcvn7Xi435tUZYZG2eAZlIrEAzgn-H60cDN2kOjdDTxQbwUkrUOICPCTXx-Pv2pqiunM3xQBlFHe7S2lBN8Gwo66oaqNvTQXCBRHV2Dyq5WVXu2jE-wJODe1bxIP9fQVhUU_G57cSbr4lBIQKjJoSUFsExGAW7ABNwXr1BoU0uTlqbRy60ZKwMwj8jVb2OXHKHg
	
	

=begin
		win_photo_reference = winner["photos"][0]["photo_reference"]
		win_photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + win_photo_reference + "&key=" + token_key
		gon.win_photo = win_photo = HTTParty.get(win_photo_url)


				@validZips = [11206, 11221, 11237, 10026, 10027, 10030, 10037, 10039,10001, 
						10011, 10018,10019, 10020, 10036, 10029, 10035, 10010, 10016, 10017, 
						10022, 10012, 10013, 10014, 10004, 10005, 10006, 10007, 10038, 10280, 
						10002, 10003, 10009, 10021, 10028, 10044, 10128,10023, 10024, 10025, 
						10031, 10032, 10033, 10034, 10040,11361, 11362, 11363, 11364, 11354, 
						11355, 11356, 11357, 11358, 11359, 11360, 11365, 11366, 11367, 11412, 
						11423, 11423, 11433, 11434, 11435, 11436, 11101, 11102, 11103, 11104,  
						11106, 11374, 11375, 11379, 11385, 11691, 11692, 11693, 11694, 11695, 
						11697, 11004, 11005, 11411, 11413, 11422, 11426, 11427, 11428, 11429, 
						11414, 11415, 11416, 11417, 11418, 11419, 11420, 11421,11368, 11369, 11370, 
						11372, 11373, 11377, 11378, 10302, 10303, 10310, 10306, 10307, 10308, 10309, 
						10312, 10301, 10304, 10305, 10314, 11105]

=end				
