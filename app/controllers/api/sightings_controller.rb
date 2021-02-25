# frozen_string_literal: true

class Api::SightingsController < Api::ApiApplicationController
  before_action :set_sighting, only: %i[show edit update destroy]

  # GET /sightings or /sightings.json
  def index
    @sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: @sightings
  end

  # GET /sightings/1 or /sightings/1.json
  def show
    @sighting = Sighting.find(params[:id])
    if @sighting
      render json: @sighting, status: :ok
    else
      render json: @sighting.errors, status: :unprocessable_entity
    end
  end

  # POST /sightings or /sightings.json
  def create
    @sighting = Sighting.new(sighting_params)

    if @sighting.save
      render json: @sighting, status: :created, location: @sighting
    else
      render json: @sighting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sightings/1 or /sightings/1.json
  def update
    if @sighting.update(sighting_params)
      render json: @sighting, status: :ok, location: @sighting
    else
      render json: @sighting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sightings/1 or /sightings/1.json
  def destroy
    @sighting.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sighting
    @sighting = Sighting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sighting_params
    params.fetch(:sighting, {}).permit(:bird_id, :lat, :long, :description)
  end
end
