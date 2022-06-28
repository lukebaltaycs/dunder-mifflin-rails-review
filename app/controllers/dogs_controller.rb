class DogsController < ApplicationController

    def show
        @dog = Dog.find(params[:id])
        @employees = @dog.employees
    end

    def index
        @dogs = Dog.all
    end

    def edit
        @dog = Dog.find(params[:id])

    end

    def update
        @dog = Dog.find(params[:id])
        @dog.assign_attributes(dog_params)
        if @dog.valid?
            @dog.save
            flash[:notice] = "Dog succesfully updated!"
            redirect_to dog_path(@dog)
        else
            render :edit
        end
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save
            flash[:notice] = "Dog succesfully created!"
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        flash[:notice] = "#{@dog.name} has been sent to a farm upstate. \n I hope you can live with yourself."

        redirect_to dogs_path
    end


    private

    def dog_params
        params.permit(:name, :breed, :age)
    end


end
