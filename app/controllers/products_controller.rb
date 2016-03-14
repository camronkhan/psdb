class ProductsController < ApplicationController

	def index
		@products = Product.sorted
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

end
