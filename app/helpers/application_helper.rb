module ApplicationHelper

	def sortable(column_title = nil)
		direction = sort_direction == 'asc' ? 'desc' : 'asc'
		link_to(column_title, params.merge(:sort => direction, :page => nil))
	end

end
