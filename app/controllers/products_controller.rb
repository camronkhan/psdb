class ProductsController < ApplicationController

	# Access methods from view (helpers/application_helper.rb#sortable)
	helper_method :sort_direction

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
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Product '#{@product.name}' created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
		@search_value = search_value
		@sort_direction = sort_direction
		@product = Product.find(params[:id])
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
		redirect_to(:action => 'index')
	end

	private

	    def product_params
	      # same as using "params[:subject]", except that it:
	      # - raises an error if :subject is not present
	      # - allows listed attributes to be mass-assigned
	      params.require(:product).permit(:company_id, :name, :image_url, :tags)
	    end

	    def search_value
	    	params[:search] || nil
	    end

	    def sort_direction
	    	# If sort direction param includes ascending or descending option,
	    	# then set sort direction to option
	    	# Else set sort direction to nil 
	    	%w[asc desc].include?(params[:sort]) ? params[:sort] : nil
	    end
	    
	    def search_and_sort(value, direction)
	    	if !direction
	    		# Sort by relevance ranking
	    		Product.search_by_product_name_and_tag(value).with_pg_search_rank
	    	elsif direction=='asc'
	    		# Sort by product ascending
	    		Product.search_by_product_name_and_tag(value).reorder("products.name ASC").with_pg_search_rank
	    	elsif direction=='desc'
	    		# Sort by product descending
	    		Product.search_by_product_name_and_tag(value).reorder("products.name DESC").with_pg_search_rank
	    	else
	    		# Sort by relevance ranking
	    		Product.search_by_product_name_and_tag(value).with_pg_search_rank
	    	end
	    end
end
