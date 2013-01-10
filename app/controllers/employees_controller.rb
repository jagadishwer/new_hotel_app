class EmployeesController < ApplicationController
  def new
    
    @employee=Employee.new
    @branches = Branch.all
    @positions=Position.all
  end

  def create
    if Employee.create(params[:employee])
       flash[:notice]="Sucsessfully created"
    else
      flash[:error]="unSucsessfully created"
    end
    redirect_to :action=>'show'
  end

  def edit
    @employee=Employee.find(params[:id])
     @branches = Branch.all
    @positions=Position.all
  end
  def update
    @employee=Employee.find(params[:employee][:id])
    if @employee.update_attributes(params[:employee])
       flash[:notice]="Sucsessfully updated"
    else
      flash[:error]="unSucsessfully operation"
    end
    redirect_to :action=>'show'
  end

  def show
    @employees=Employee.all
  end

end
