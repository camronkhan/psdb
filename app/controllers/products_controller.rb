class ProductsController < ApplicationController

	# Access methods from view (helpers/application_helper.rb)
	helper_method :sort_direction

	# Autocompletion in product form
	autocomplete :company, :name, full: true
	autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'

	def index
		@search_value = search_value
		@filter_by_product = filter_by_product
		@filter_by_company = filter_by_company
		@filter_by_tag = filter_by_tag
		@sort_direction = sort_direction
		@products = search_and_sort(search_value, filter_criteria, sort_direction).paginate(per_page: 10, page: params[:page])
	end

	def show
		@search_value = search_value
		@filter_by_product = filter_by_product
		@filter_by_company = filter_by_company
		@filter_by_tag = filter_by_tag
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
	end

	def new
		@search_value = search_value
		@filter_by_product = filter_by_product
		@filter_by_company = filter_by_company
		@filter_by_tag = filter_by_tag
		@sort_direction = sort_direction
		@product = Product.new
		@product.technologist_assignments.build
		@product.servicer_assignments.build
		@product.notes.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Product '#{@product.name}' created successfully."
			redirect_to(action: 'show',
						id: @product.id,
						search_for: search_value,
						filter_by_product: filter_by_product,
						filter_by_company: filter_by_company,
						filter_by_tag: filter_by_tag,
						sort_by: sort_direction)
		else
			render('new')
		end
	end

	def edit
		@search_value = search_value
		@filter_by_product = filter_by_product
		@filter_by_company = filter_by_company
		@filter_by_tag = filter_by_tag
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
		@product.technologist_assignments.build
		@product.servicer_assignments.build
		@product.notes.build
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash[:notice] = "Product '#{@product.name}' updated successfully."
			redirect_to(action: 'show',
						id: @product.id,
						search_for: search_value,
						filter_by_product: filter_by_product,
						filter_by_company: filter_by_company,
						filter_by_tag: filter_by_tag,
						sort_by: sort_direction)
		else
			render('edit')
		end
	end

	def delete
		@search_value = search_value
		@filter_by_product = filter_by_product
		@filter_by_company = filter_by_company
		@filter_by_tag = filter_by_tag
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
	end

	def destroy
		product = Product.find(params[:id]).destroy
		flash[:notice] = "Product '#{product.name}' deleted successfully."
		redirect_to(action: 'index',
					search_for: search_value,
					filter_by_product: filter_by_product,
					filter_by_company: filter_by_company,
					filter_by_tag: filter_by_tag,
					sort_by: sort_direction)
	end

	private

      	# Whitelist allowable attributes
	    def product_params
			params.require(:product).permit(:id,
	      								  	:company_id,
	      								  	:name,
	      								  	:image_url,
	      								  	:company_name,
	      								  	tag_list: [],
	      								  	technologist_ids: [],
	      								  	servicer_ids: [],
	      								  	technologist_assignments_attributes: [:id, :product_id, :technologist_id, :condition, :_destroy],
	      								  	servicer_assignments_attributes: [:id, :product_id, :servicer_id, :condition, :_destroy],
	      								  	notes_attributes: [:id, :annotatable_id, :annotatable_type, :data, :position, :_destroy])
	    end

	    # Use search value provided if params if present, else use nil
	    def search_value
	    	params[:search_for] || nil
	    end

		def filter_by_product
			params[:filter_by_product]=='on' ? 'on' : nil
		end

		def filter_by_company
			params[:filter_by_company]=='on' ? 'on' : nil
		end

		def filter_by_tag
			params[:filter_by_tag]=='on' ? 'on' : nil
		end

	    # Return search criteria based on checkboxes selected
	    # p == product
	    # c == company
	    # t == tag
	    # pc == product & company
	    # pt == product & tag
	    # ct == company & tag
	    # pct == product & company & tag
	    def filter_criteria
	    	if filter_by_product=='on'
	    		if filter_by_company=='on'
	    			filter_by_tag=='on' ? 'pct' : 'pc'
	    		else
	    			filter_by_tag=='on' ? 'pt' : 'p'
	    		end
	    	else
	    		if filter_by_company=='on'
	    			filter_by_tag=='on' ? 'ct' : 'c'
	    		else
	    			filter_by_tag=='on' ? 't' : nil
	    		end
	    	end
	    end

	    # Set sort direction to 'nil' unless params[:sort_by] includes 'asc' or 'desc'
	    def sort_direction
	    	%w[asc desc].include?(params[:sort_by]) ? params[:sort_by] : nil
	    end

	    # Search db and sort results based on params[:sort_by]
		def search_and_sort(value, criteria, direction)
			if value.blank? 
				if direction=='asc'
					Product.all.ascending
				elsif direction=='desc'
					Product.all.descending
				else
					Product.all.ascending
				end
			else
				case criteria
				when 'p'
					if direction=='asc'
						Product.search_by_product(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_product(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_product(value).with_pg_search_rank
					end
				when 'c'
					if direction=='asc'
						Product.search_by_company(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_company(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_company(value).with_pg_search_rank
					end
				when 't'
					if direction=='asc'
						Product.search_by_tag(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_tag(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_tag(value).with_pg_search_rank
					end
				when 'pc'
					if direction=='asc'
						Product.search_by_product_company(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_product_company(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_company(value).with_pg_search_rank
					end
				when 'pt'
					if direction=='asc'
						Product.search_by_product_tag(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_product_tag(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_tag(value).with_pg_search_rank
					end
				when 'ct'
					if direction=='asc'
						Product.search_by_company_tag(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_company_tag(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_company_tag(value).with_pg_search_rank
					end
				when 'pct'
					if direction=='asc'
						Product.search_by_product_company_tag(value).fts_ascending.with_pg_search_rank
					elsif direction=='desc'
						Product.search_by_product_company_tag(value).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_company_tag(value).with_pg_search_rank
					end
				else
					Product.search_by_product_company_tag(value).with_pg_search_rank
				end
			end
		end
end