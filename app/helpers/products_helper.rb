module ProductsHelper

	# Persists active / inactive state for each search criteria button (checkbox)
	def is_active?(checkboxname)
		case checkboxname
		when 'filter_by_product'
			if filter_by_product=='on' then 'active'
			else
				if filter_by_company!='on' && filter_by_tag!='on' then 'active' end
			end
		when 'filter_by_company'
			if filter_by_company=='on' then 'active' end
		when 'filter_by_tag'
			if filter_by_tag=='on' then 'active' end
		else
			return nil
		end
	end

	# Persists active / inactive state for each search criteria button (checkbox)
	def is_checked?(checkboxname)
		case checkboxname
		when 'filter_by_product'
			if filter_by_product=='on' then 'checked'
			else
				if filter_by_company!='on' && filter_by_tag!='on' then 'checked' end
			end
		when 'filter_by_company'
			if filter_by_company=='on' then 'checked' end
		when 'filter_by_tag'
			if filter_by_tag=='on' then 'checked' end
		else
			return nil
		end
	end

	# Format relevance ranking float as percentage
	def relevance_to_percentage(relevance)
		relevance *= 100
		percent = number_to_percentage(relevance, precision: 2)
		raw "<td>#{percent}</td>"
	end
end
