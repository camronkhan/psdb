class TechnologistsController < ApplicationController
  
  def index
    @technologists = Technologist.sorted
  end

  def show
    @technologist = Technologist.find(params[:id])
  end

  def new
    @technologist = Technologist.new({:name => "Default"})
  end

  def create
    @technologist = Technologist.new(technologist_params)
    if @technologist.save
      flash[:notice] = "Technologist '#{@technologist.name}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @technologist = Technologist.find(params[:id])
  end

  def update
    @technologist = Technologist.find(params[:id])
    if @technologist.update_attributes(technologist_params)
      flash[:notice] = "Technologist '#{@technologist.name}' updated successfully."
      redirect_to(:action => 'show', :id => @technologist.id)
    else
      render('edit')
    end
  end

  def delete
    @technologist = Technologist.find(params[:id])
  end

  def destroy
    technologist = Technologist.find(params[:id]).destroy
    flash[:notice] = "Technologist '#{technologist.name}' deleted successfully."
    redirect_to(:action => 'index')
  end

  private

      def technologist_params
        # same as using "params[:subject]", except that it:
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
        params.require(:technologist).permit(:name, :internal_phone, :external_phone, :hours, :escalation)
      end
      
end
