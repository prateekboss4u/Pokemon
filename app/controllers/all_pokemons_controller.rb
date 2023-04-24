class AllPokemonsController < ApplicationController
    def index
        @all_pokemons = AllPokemons.all
    end

    def show
        @all_pokemon = AllPokemon.find(params[:id])
    end

    def create
        @all_pokemon = AllPokemon.new(user_params)
        
        if @all_pokemon.save
            render :show, status: :created, location: @all_pokemon
        else
            render json: @all_pokemon.errors, status: :unprocessable_entity
        end
    end

    def update
        @all_pokemon = AllPokemon.find(params[:id])
        if @all_pokemon.update(user_params)
            render :show, status: :ok, location: @all_pokemon
        else
            render json: @all_pokemon.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @all_pokemon = AllPokemon.find(params[:id])
        
        if @all_pokemon.destroy
            render json: 'User destroyed successfully', status: :ok
        else
            render json: 'Sorry! There was an issue while deleting user', status: :unprocessable_entity
        end
    end

    

    private

    def user_params
        params.require(:all_pokemon).permit(:name, :strength)
    end
end
