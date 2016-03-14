class TechnologistAssignmentsController < ApplicationController

	def index
    @technologist_assignments = TechnologistAssignment.all
  end

  def show
    @technologist_assignment = TechnologistAssignment.find(params[:id])
  end

  def new
    @technologist_assignment = TechnologistAssignment.new({:technologist_id => 1, :product_id => 1, :condition => "All"})
  end

  def create
    @technologist_assignment = TechnologistAssignment.new(technologist_assignment_params)
    if @technologist_assignment.save
      flash[:notice] = "Technologist assignment created successfully: #{@technologist_assignment.technologist.name} supports #{@technologist_assignment.product.name}."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @technologist_assignment = TechnologistAssignment.find(params[:id])
  end

  def update
    @technologist_assignment = TechnologistAssignment.find(params[:id])
    if @technologist_assignment.update_attributes(technologist_assignment_params)
      flash[:notice] = "Technologist assignment updated successfully: #{@technologist_assignment.technologist.name} supports #{@technologist_assignment.product.name}."
      redirect_to(:action => 'show', :id => @technologist_assignment.id)
    else
      render('edit')
    end
  end

  def delete
    @technologist_assignment = TechnologistAssignment.find(params[:id])
  end

  def destroy
    technologist_assignment = TechnologistAssignment.find(params[:id]).destroy
    flash[:notice] = "Technologist assignment deleted successfully: : #{technologist_assignment.technologist.name} supports #{technologist_assignment.product.name}."
    redirect_to(:action => 'index')
  end

  private

      def technologist_assignment_params
        # same as using "params[:subject]", except that it:
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
        params.require(:technologist_assignment).permit(:technologist_id, :product_id, :condition)
      end

end
