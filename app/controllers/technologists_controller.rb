class TechnologistsController < ApplicationController
  
  # Access methods from view (helpers/application_helper.rb)
  helper_method :sort_direction

  def index
    @search_value = search_value
    @sort_direction = sort_direction
    @technologists = search_and_sort(@search_value, sort_direction).paginate(per_page: 10, page: params[:page])
  end

  def show
    @search_value = search_value
    @sort_direction = sort_direction
    @technologist = Technologist.find(params[:id])
  end

  def new
    @search_value = search_value
    @sort_direction = sort_direction
    @technologist = Technologist.new
    @technologist.notes.build
  end

  def create
    @technologist = Technologist.new(technologist_params)
    if @technologist.save
      flash[:notice] = "Technologist '#{@technologist.name}' created successfully."
      redirect_to(action: 'show',
                  id: @technologist.id,
                  sort: sort_direction,
                  search: search_value)
    else
      render('new')
    end
  end

  def edit
    @search_value = search_value
    @sort_direction = sort_direction
    @technologist = Technologist.find(params[:id])
    @technologist.notes.build
  end

  def update
    @technologist = Technologist.find(params[:id])
    if @technologist.update_attributes(technologist_params)
      flash[:notice] = "Technologist '#{@technologist.name}' updated successfully."
      redirect_to(action: 'show',
                  id: @technologist.id,
                  sort: sort_direction,
                  search: search_value)
    else
      render('edit')
    end
  end

  def delete
    @search_value = search_value
    @sort_direction = sort_direction
    @technologist = Technologist.find(params[:id])
  end

  def destroy
    technologist = Technologist.find(params[:id]).destroy
    flash[:notice] = "Technologist '#{technologist.name}' deleted successfully."
    redirect_to(action: 'index',
                sort: sort_direction,
                search: search_value)
  end

  private

      # Whitelist allowable attributes
      def technologist_params
        params.require(:technologist).permit(:name,
                                             :internal_phone,
                                             :external_phone,
                                             :hours,
                                             :escalation,
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
          Technologist.all.order("technologists.name ASC")
        elsif value.blank? && direction=='asc'
          Technologist.all.order("technologists.name ASC")
        elsif value.blank? && direction=='desc'
          Technologist.all.order("technologists.name DESC")
        elsif value && direction=='asc'
          Technologist.full_text_search(value).reorder("technologists.name ASC").with_pg_search_rank
        elsif value && direction=='desc'
          Technologist.full_text_search(value).reorder("technologists.name DESC").with_pg_search_rank
        else
          Technologist.full_text_search(value).with_pg_search_rank
        end
      end
end
