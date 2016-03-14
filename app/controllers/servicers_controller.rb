class ServicersController < ApplicationController
  
  def index
    @servicers = Servicer.sorted
  end

  def show
    @servicer = Servicer.find(params[:id])
  end

  def new
    @servicer = Servicer.new({:name => "Default"})
  end

  def create
    @servicer = Servicer.new(servicer_params)
    if @servicer.save
      flash[:notice] = "Servicer '#{@servicer.name}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @servicer = Servicer.find(params[:id])
  end

  def update
    @servicer = Servicer.find(params[:id])
    if @servicer.update_attributes(servicer_params)
      flash[:notice] = "Servicer '#{@servicer.name}' updated successfully."
      redirect_to(:action => 'show', :id => @servicer.id)
    else
      render('edit')
    end
  end

  def delete
    @servicer = Servicer.find(params[:id])
  end

  def destroy
    servicer = Servicer.find(params[:id]).destroy
    flash[:notice] = "Servicer '#{servicer.name}' deleted successfully."
    redirect_to(:action => 'index')
  end

  private

      def servicer_params
        # same as using "params[:subject]", except that it:
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
        params.require(:servicer).permit(:name, :internal_phone, :external_phone, :address)
      end
      
end
