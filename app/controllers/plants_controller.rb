class PlantsController < ApplicationController

    # Get /plants
    def index
        plants = Plant.all 
        render json: plants
    end

    # get /plants/:id

    def show
        plant = Plant.find_by(id: params[:id])
        render json: plant
    end

    # POST /plants

    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end 

    def plant_params
        params.permit(:name, :image, :price)
    end

    # In order to get the above working must have data migrated+seeded, then go to config routs.rb and have:
        # resources :plants, only: [:index, :show, :create]
end