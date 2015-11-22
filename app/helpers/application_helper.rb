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

	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction,:search => params[:search]}, {:class => css_class}
	end

	def show_field_with_wrapper(wrapper,*args)
		x = show_field(*args)
		y = '<div class="'+wrapper+'">'+x+"</div>" if x
		y.html_safe if y
	end

	def yesno(value)
		if value==true
			"Yes"
		elsif value==false
			"No"
		else
			nil
		end
	end

end
