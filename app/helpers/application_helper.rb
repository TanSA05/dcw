module ApplicationHelper
	def redirect_unknown_error
		redirect_to root_path, error: "Some error occured. Please contact admin"
	end
end
