module ApplicationHelper
	def redirect_unknown_error
		redirect_to root_path, error: "Some error occured. Please contact admin"
	end
	def current_org
		current_user.organization if current_user
	end
	def is_dcw?
		current_org.category == :dcw if current_org
	end
	def only_dcw
		redirect_to root_path, error: "Access Denied" unless is_dcw?
	end

end
