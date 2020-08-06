class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end

    def show
        animal = Animal.find(params[:id])
        sighting = Sighting.where(:animal_id => animal.id)
        respond_to do |format| 
            format.json {render :json => {:animal => animal, :sighting => sighting}}
        end     
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end

    end

    def destroy 
        animal = Animal.find(params[:id])
        animal.destroy
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end


    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :taxonomy_class)
    end



end
