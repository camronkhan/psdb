module ProductsHelper

	# Persists active / inactive state for each search criteria button (checkbox)
	def is_active?(checkboxname, state)
	case checkboxname
			when 'filter_by_product'
				if state=='on' then 'active' end
			when 'filter_by_company'
				if state=='on' then 'active' end
			when 'filter_by_tag'
				if state=='on' then 'active' end
			else
				return nil
			end
	end
end
