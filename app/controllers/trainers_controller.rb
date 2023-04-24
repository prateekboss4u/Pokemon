class TrainersController < ApplicationController
    
    def index
        @trainers = Trainer.all
    end

    def show
        @trainer = Trainer.find(params[:id])
    end

    def create
        @trainer = Trainer.new(user_params)
        
        if @trainer.save
            render :show, status: :created, location: @trainer
        else
            render json: @trainer.errors, status: :unprocessable_entity
        end
    end

    def update
        @trainer = Trainer.find(params[:id])

        if @trainer.update(user_params)
            render :show, status: :ok, location: @trainer
        else
            render json: @trainer.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @trainer = Trainer.find(params[:id])

        if @trainer.destroy
            render json: 'User deleted successfully', status: :ok
        else
            render json: 'generated an error while deleting', status: :unprocessable_entity
    end

    private
    def user_params
        params.require(:trainer).permit(:name, :total_pokemon, :victory)
    end

end
