class SpicesController < ApplicationController

    # GET /spices
    def index
        render json: Spice.all
    end

    # POST /spices
    def create
        render json: Spice.create(spice_params), status: :created
    end

    # GET /spices/:id
    def show
        render json: find_spice
    end

    # PATCH /spices/:id
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/:id
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end
end
