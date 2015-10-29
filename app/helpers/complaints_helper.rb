module ComplaintsHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
	def show_field(name,value)
		title = "<h5><b>"+name+"</b></h5>"
		desc = '<div class="well well-sm">'+value+'</div>'
		x = title+desc
		x.html_safe
	end
end
