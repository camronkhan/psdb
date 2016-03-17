module ApplicationHelper

	def sortable(column_title = nil)
		direction = column_title == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
		link_to(column_title, params.merge(:sort => column_title, :direction => direction, :page => nil))
	end

end
