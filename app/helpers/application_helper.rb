module ApplicationHelper

	def sortable(column_title = nil)
		direction = sort_direction == 'asc' ? 'desc' : 'asc'
		link_to(column_title, params.merge(:direction => direction, :page => nil))
	end

end
