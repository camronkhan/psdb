class ProductsController < ApplicationController

	# Access methods from view (helpers/application_helper.rb#sortable)
	helper_method :sort_direction

	# Autocompletion in product form
	autocomplete :company, :name, full: true
	autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'

	def index
		@search_value = search_value
		@sort_direction = sort_direction
		@products = search_and_sort(@search_value, sort_direction).paginate(:per_page => 10, :page => params[:page])
	end

	def show
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
	end

	def new
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.new({:name => "Default"})
		@product.notes.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Product '#{@product.name}' created successfully."
			redirect_to(:action => 'show',
						:id => @product.id,
						:sort => sort_direction,
						:search => search_value)
		else
			render('new')
		end
	end

	def edit
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
		@product.notes.build
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash[:notice] = "Product '#{@product.name}' updated successfully."
			redirect_to(:action => 'show',
						:id => @product.id,
						:sort => sort_direction,
						:search => search_value)
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
		redirect_to(:action => 'index',
					:sort => sort_direction,
					:search => search_value)
	end

	private

      	# Whitelist allowable attributes to be mass-assigned; raises an error if :subject is not present
	    def product_params
	      params.require(:product).permit(:id, :company_id, :name, :image_url, :company_name, tag_list: [],  notes_attributes: [:id, :annotatable_id, :annotatable_type, :data, :position, :_destroy])
	    end

	    # Use search value provided if params if present, else use nil
	    def search_value
	    	params[:search] || nil
	    end

		# If sort direction param includes ascending or descending option,
    		# Then set sort direction to option
    		# Else set sort direction to nil 
	    def sort_direction
	    	%w[asc desc].include?(params[:sort]) ? params[:sort] : nil
	    end
	    
	    # Sort product table by relevance rank, asc product name, or dsc product name
	    def search_and_sort(value, direction)
	    	if !direction
	    		# Sort by relevance ranking
	    		Product.full_text_search(value).with_pg_search_rank
	    	elsif direction=='asc'
	    		# Sort by product ascending
	    		Product.full_text_search(value).reorder("products.name ASC").with_pg_search_rank
	    	elsif direction=='desc'
	    		# Sort by product descending
	    		Product.full_text_search(value).reorder("products.name DESC").with_pg_search_rank
	    	else
	    		# Sort by relevance ranking
	    		Product.full_text_search(value).with_pg_search_rank
	    	end
	    end
end
