class ProductsController < ApplicationController

	# Access methods from view (helpers/application_helper.rb#sortable)
	helper_method :sort_column, :sort_direction

	def index
		#@products = search_and_sort(search_value, sort_column, sort_direction).paginate(:per_page => 2, :page => params[:page])
		#@products = Product.search_by_product_name_and_tag(params[:product])
		@search_value = search_value
		@products = search_and_sort(@search_value, sort_column, sort_direction)
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
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
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash[:notice] = "Product '#{@product.name}' updated successfully."
			redirect_to(:action => 'show', :id => @product.id)
		else
			render('edit')
		end
	end

	def delete
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
	      params.require(:product).permit(:company_id, :name, :image)
	    end

	    def search_value
	    	params[:product] || nil
	    end

	    def sort_column
	    	%w[Product Company].include?(params[:sort]) ? params[:sort] : nil
	    end

	    def sort_direction
	    	%w[asc desc].include?(params[:direction]) ? params[:direction] : nil
	    end
	    
	    def search_and_sort(value, column, direction)
	    	if !column && !direction
	    		Product.search_by_product_name_and_tag(value).with_pg_search_rank
	    	elsif column=='Product' && direction=='asc'
	    		#Product.search(value).sorted
	    		Product.search_by_product_name_and_tag(value).reorder("products.name ASC").with_pg_search_rank
	    	elsif column=='Product' && direction=='desc'
	    		#Product.search(value).reverse_sorted
	    		Product.search_by_product_name_and_tag(value).reorder("products.name DESC").with_pg_search_rank
    		elsif column=='Company' && direction=='asc'
	    		#Product.search(value).company_sorted
	    		Product.search_by_product_name_and_tag(value).reorder("companies.name ASC", "products.name ASC").with_pg_search_rank
    		elsif column=='Company' && direction=='desc'
	    		#Product.search(value).company_reverse_sorted
	    		Product.search_by_product_name_and_tag(value).reorder("companies.name DESC", "products.name ASC").with_pg_search_rank
	    	else
	    		#Product.search(value).sorted
	    		Product.search_by_product_name_and_tag(value).with_pg_search_rank
	    	end
	    end
end
