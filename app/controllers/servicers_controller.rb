class ServicersController < ApplicationController
  
  # Access methods from view (helpers/application_helper.rb)
  helper_method :sort_direction

  def index
    @search_value = search_value
    @sort_direction = sort_direction
    @servicers = search_and_sort(@search_value, sort_direction).paginate(per_page: 10, page: params[:page])
  end

  def show
    @search_value = search_value
    @sort_direction = sort_direction
    @servicer = Servicer.find(params[:id])
  end

  def new
    @search_value = search_value
    @sort_direction = sort_direction
    @servicer = Servicer.new
    @servicer.notes.build
  end

  def create
    @servicer = Servicer.new(servicer_params)
    if @servicer.save
      flash[:notice] = "Servicer '#{@servicer.name}' created successfully."
      redirect_to(action: 'show',
                  id: @servicer.id,
                  sort: sort_direction,
                  search: search_value)
    else
      render('new')
    end
  end

  def edit
    @search_value = search_value
    @sort_direction = sort_direction
    @servicer = Servicer.find(params[:id])
    @servicer.notes.build
  end

  def update
    @servicer = Servicer.find(params[:id])
    if @servicer.update_attributes(servicer_params)
      flash[:notice] = "Servicer '#{@servicer.name}' updated successfully."
      redirect_to(action: 'show',
                  id: @servicer.id,
                  sort: sort_direction,
                  search: search_value)
    else
      render('edit')
    end
  end

  def delete
    @search_value = search_value
    @sort_direction = sort_direction
    @servicer = Servicer.find(params[:id])
  end

  def destroy
    servicer = Servicer.find(params[:id]).destroy
    flash[:notice] = "Servicer '#{servicer.name}' deleted successfully."
    redirect_to(action: 'index',
                sort: sort_direction,
                search: search_value)
  end

  private

      # Whitelist allowable attributes
      def servicer_params
        params.require(:servicer).permit(:name,
                                         :internal_phone,
                                         :external_phone,
                                         :address,
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

      # Search db and sort results based on params[:sort]
      def search_and_sort(value, direction)
        if value.blank? && direction.blank?
          Servicer.all.order("servicers.name ASC")
        elsif value.blank? && direction=='asc'
          Servicer.all.order("servicers.name ASC")
        elsif value.blank? && direction=='desc'
          Servicer.all.order("servicers.name DESC")
        elsif value && direction=='asc'
          Servicer.full_text_search(value).reorder("servicers.name ASC").with_pg_search_rank
        elsif value && direction=='desc'
          Servicer.full_text_search(value).reorder("servicers.name DESC").with_pg_search_rank
        else
          Servicer.full_text_search(value).with_pg_search_rank
        end
      end
end
