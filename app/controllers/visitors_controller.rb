class VisitorsController < ApplicationController
	before_action :check_logged_in

	def check_logged_in
		if user_signed_in?
			redirect_to dashboard_path
		end
	end
end
