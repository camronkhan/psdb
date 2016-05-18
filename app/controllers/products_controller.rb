class ProductsController < ApplicationController

	# Access methods from view (helpers/application_helper.rb)
	#helper_method :sort_direction

	# Autocompletion in product form
	autocomplete :company, :name, full: true
	autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'

	def index
		@search_value = search_value
		@sort_direction = sort_direction
		@products = search_and_sort(@search_value, search_criteria, sort_direction).paginate(per_page: 10, page: params[:page])
	end

	def show
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
	end

	def new
		@search_value = search_value
		@sort_direction = sort_direction
		@uploader = Product.new.image_url
		@uploader.success_action_redirect = new_product_url
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
						sort: sort_direction,
						search: search_value)
		else
			render('new')
		end
	end

	def edit
		@search_value = search_value
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
						sort: sort_direction,
						search: search_value)
		else
			render('edit')
		end
	end

	def delete
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
	end

	def destroy
		product = Product.find(params[:id]).destroy
		flash[:notice] = "Product '#{product.name}' deleted successfully."
		redirect_to(action: 'index',
					sort: sort_direction,
					search: search_value)
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
	    	params[:query] || nil
	    end

	    # Return search criteria based on checkboxes selected
	    def search_criteria
	    	if params[:productsearch]=='on'
	    		if params[:companysearch]=='on'
	    			params[:tagsearch]=='on' ? 'pct' : 'pc'
	    		else
	    			params[:tagsearch]=='on' ? 'pt' : 'p'
	    		end
	    	else
	    		if params[:companysearch]=='on'
	    			params[:tagsearch]=='on' ? 'ct' : 'c'
	    		else
	    			params[:tagsearch]=='on' ? 't' : nil
	    		end
	    	end
	    end

	    # Set sort direction to 'nil' unless params[:sort] includes 'asc' or 'desc'
	    def sort_direction
	    	%w[asc desc].include?(params[:sort]) ? params[:sort] : nil
	    end

	    # Search db and sort results based on params[:sort]
		def search_and_sort(query, criteria, order)
			if query.blank? 
				if order=='asc'
					Product.all.ascending
				elsif order=='desc'
					Product.all.descending
				else
					Product.all.ascending
				end
			else
				if criteria=='p'
					if order=='asc'
						Product.search_by_product(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_product(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_product(query).with_pg_search_rank
					end
				elsif criteria=='c'
					if order=='asc'
						Product.search_by_company(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_company(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_company(query).with_pg_search_rank
					end
				elsif criteria=='t'
					if order=='asc'
						Product.search_by_tag(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_tag(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_tag(query).with_pg_search_rank
					end
				elsif criteria=='pc'
					if order=='asc'
						Product.search_by_product_company(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_product_company(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_company(query).with_pg_search_rank
					end
				elsif criteria=='pt'
					if order=='asc'
						Product.search_by_product_tag(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_product_tag(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_tag(query).with_pg_search_rank
					end
				elsif criteria=='ct'
					if order=='asc'
						Product.search_by_company_tag(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_company_tag(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_company_tag(query).with_pg_search_rank
					end
				elsif criteria=='pct'
					if order=='asc'
						Product.search_by_product_company_tag(query).fts_ascending.with_pg_search_rank
					elsif order=='desc'
						Product.search_by_product_company_tag(query).fts_descending.with_pg_search_rank
					else
						Product.search_by_product_company_tag(query).with_pg_search_rank
					end
				else
					Product.search_by_product_company_tag(query).with_pg_search_rank
				end
			end
		end
end