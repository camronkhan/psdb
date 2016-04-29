module ApplicationHelper

	# Provides a hyperlinked column heading to sort by asc or dsc
	def sortable(column_title = nil)
		direction = sort_direction == 'asc' ? 'desc' : 'asc'
		link_to(column_title, params.merge(:sort => direction, :page => nil))
	end

	# Checks if the image URI is valid, returns placeholder image if not
	def validateImage(image_url)
		require 'open-uri' 
		open(image_url) do |f|
			f.status.first
		end
	end
end
