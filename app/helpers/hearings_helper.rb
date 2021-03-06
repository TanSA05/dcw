module HearingsHelper
	def show_field(name,value=nil,label=nil)
		label = name.to_s.humanize unless label
		value ||= @hearing.send(name)
		value = yesno(value) if value.in? [true, false]
		if value
			title = "<h5><b>"+label+"</b></h5>"
			desc = '<div class="well well-sm">'+value.to_s.humanize+'</div>'
			x = title+desc
			x.html_safe
		end
	end
end
