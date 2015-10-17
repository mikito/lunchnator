class TopController < BaseController
	def index
		@restaurants = current_user.restaurants 
	end
end
