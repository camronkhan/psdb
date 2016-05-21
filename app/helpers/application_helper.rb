module ApplicationHelper

	# Provides a hyperlinked column heading to sort by asc or dsc
	def sortable(column_title = nil)
		direction = sort_direction == 'asc' ? 'desc' : 'asc'
		link_to(column_title, params.merge(:sort_by => direction, :page => nil))
	end

end
