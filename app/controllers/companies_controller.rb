class CompaniesController < ApplicationController

	def index
		@companies = Company.sorted
	end

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new({:name => "Default"})
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			flash[:notice] = "Company '#{@company.name}' created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(company_params)
			flash[:notice] = "Company '#{@company.name}' updated successfully."
			redirect_to(:action => 'show', :id => @company.id)
		else
			render('edit')		
		end
	end

	def delete
		@company = Company.find(params[:id])
	end

	def destroy
		company = Company.find(params[:id]).destroy
		flash[:notice] = "Company '#{company.name}' deleted successfully."
		redirect_to(:action => 'index')
	end

	private

	    def company_params
	      # same as using "params[:subject]", except that it:
	      # - raises an error if :subject is not present
	      # - allows listed attributes to be mass-assigned
	      params.require(:company).permit(:name, :website)
	    end
	
end
