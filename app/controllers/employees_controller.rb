class EmployeesController < ApplicationController

        def show
            @employee = Employee.find(params[:id])
        end
    
        def index
            @employees = Employee.all
        end
    
        def edit
            @employee = Employee.find(params[:id])    
        end
    
        def update
            @employee = Employee.find(params[:id])
            @employee.assign_attributes(employee_params)
            @employee.assign_attributes(dog_id: params[:employee][:dog_id])
            if @employee.valid?
                @employee.save
                flash[:notice] = "Employee succesfully updated!"
                redirect_to employee_path(@employee)
            else
                render :edit
            end
        end
    
        def new
            @employee = Employee.new
        end
    
        def create
            @employee = Employee.new(employee_params)
            @employee.assign_attributes(dog_id: params[:employee][:dog_id])
            if @employee.valid?
                @employee.save
                flash[:notice] = "Employee succesfully created!"
                redirect_to employee_path(@employee)
            else
                render :new
            end
        end
    
        def destroy
            @employee = Employee.find(params[:id])
            @employee.destroy
    
            flash[:notice] = "#{@employee.to_s} has been fired. \n I hope you can live with yourself."
            redirect_to employees_path
        end
    
    
        private
    
        def employee_params
            params.permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        end
    
        
end
