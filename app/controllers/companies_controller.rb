class CompaniesController < ApplicationController

	# Access methods from view (helpers/application_helper.rb)
	helper_method :sort_direction
	
	def index
		@search_value = search_value
		@sort_direction = sort_direction
		@companies = search_and_sort(@search_value, @sort_direction).paginate(:per_page => 10, :page => params[:page])
	end

	def show
		@search_value = search_value
		@sort_direction = sort_direction
		@company = Company.find(params[:id])
	end

	def new
		@search_value = search_value
		@sort_direction = sort_direction
		@company = Company.new({:name => "Default"})
		@company.notes.build
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
		@search_value = search_value
		@sort_direction = sort_direction
		@company = Company.find(params[:id])
		@company.notes.build
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
		@search_value = search_value
		@sort_direction = sort_direction
		@company = Company.find(params[:id])
	end

	def destroy
		company = Company.find(params[:id]).destroy
		flash[:notice] = "Company '#{company.name}' deleted successfully."
		redirect_to(:action => 'index')
	end

	private

		# Whitelist allowable attributes to be mass-assigned; raises an error if :subject is not present
	    def company_params
	      params.require(:company).permit(:name,
	      								  :website_url,
	      								  notes_attributes: [:id, :annotatable_id, :annotatable_type, :data, :position, :_destroy])
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

	    # Sort company table by relevance rank, asc company name, or dsc company name
	    def search_and_sort(value, direction)
	    	if !value && !direction
	    		Company.all.order("companies.name ASC")
	    	elsif !value && direction=='asc'
	    		Company.all.order("companies.name ASC")
    		elsif !value && direction=='desc'
	    		Company.all.order("companies.name DESC")
	    	elsif value && direction=='asc'
	    		Company.full_text_search(value).reorder("companies.name ASC").with_pg_search_rank
	    	elsif value && direction=='desc'
	    		Company.full_text_search(value).reorder("companies.name DESC").with_pg_search_rank
	    	else
	    		Company.full_text_search(value).with_pg_search_rank
	    	end
	    end
end
