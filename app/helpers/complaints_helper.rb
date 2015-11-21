module ComplaintsHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
	def show_field(name,value=nil,label=nil)
		label = name.to_s.humanize unless label
		value ||= @complaint.send(name)
		if value
			title = "<h5><b>"+label+"</b></h5>"
			desc = '<div class="well well-sm">'+value.to_s.humanize+'</div>'
			x = title+desc
			x.html_safe
		end
	end

	def show_field_with_wrapper(wrapper,*args)
		if @hearing_field
			x = show_field(*args)
		else
			x = show_hearing_field(*args)
		end
		y = '<div class="'+wrapper+'">'+x+"</div>" if x
		y.html_safe if y
	end

	def show_hearing_field(name,value=nil,label=nil)
		label = name.to_s.humanize unless label
		value ||= @hearing.send(name) if @hearing_method
		value = value ? "Yes":"No" if @hearing_method and value.in? [true, false]
		if value
			title = "<h5><b>"+label+"</b></h5>"
			desc = '<div class="well well-sm">'+value.to_s.humanize+'</div>'
			x = title+desc
			x.html_safe
		end
	end
end
