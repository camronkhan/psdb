class ServicerAssignmentsController < ApplicationController

	def index
    @servicer_assignments = ServicerAssignment.all
  end

  def show
    @servicer_assignment = ServicerAssignment.find(params[:id])
  end

  def new
    @servicer_assignment = ServicerAssignment.new({:servicer_id => 1, :product_id => 1, :condition => "All"})
  end

  def create
    @servicer_assignment = ServicerAssignment.new(servicer_assignment_params)
    if @servicer_assignment.save
      flash[:notice] = "Servicer assignment created successfully: #{@servicer_assignment.servicer.name} repairs #{@servicer_assignment.product.name}."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @servicer_assignment = ServicerAssignment.find(params[:id])
  end

  def update
    @servicer_assignment = ServicerAssignment.find(params[:id])
    if @servicer_assignment.update_attributes(servicer_assignment_params)
      flash[:notice] = "Servicer assignment updated successfully: #{@servicer_assignment.servicer.name} repairs #{@servicer_assignment.product.name}."
      redirect_to(:action => 'show', :id => @servicer_assignment.id)
    else
      render('edit')
    end
  end

  def delete
    @servicer_assignment = ServicerAssignment.find(params[:id])
  end

  def destroy
    servicer_assignment = ServicerAssignment.find(params[:id]).destroy
    flash[:notice] = "Servicer assignment deleted successfully: : #{servicer_assignment.servicer.name} repairs #{servicer_assignment.product.name}."
    redirect_to(:action => 'index')
  end

  private

      def servicer_assignment_params
        # same as using "params[:subject]", except that it:
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
        params.require(:servicer_assignment).permit(:servicer_id, :product_id, :condition)
      end

end
