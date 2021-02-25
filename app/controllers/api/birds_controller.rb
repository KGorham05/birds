# frozen_string_literal: true

class Api::BirdsController < Api::ApiApplicationController
  before_action :set_bird, only: %i[show edit update destroy]

  def index
    @birds = Bird.all
    render json: @birds, status: 200
  end

  # GET /birds/1 or /birds/1.json
  def show
    @bird = Bird.joins(:sightings).find(params[:id])
    if @bird
      render json: {
        "bird": @bird,
        "sightings": [@bird.sightings]
      }, status: :ok
    else
      render json: @bird.errors, status: :unprocessable_entity
    end
  end

  # POST /birds or /birds.json
  def create
    @bird = Bird.new(bird_params)
    if @bird.save
      render json: @bird, status: :created, location: @bird
    else
      render json: @bird.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birds/1 or /birds/1.json
  def update
    if @bird.update(bird_params)
      render json: @bird, status: :ok, location: @bird
    else
      render json: @bird.errors, status: :unprocessable_entity
    end
  end

  # DELETE /birds/1 or /birds/1.json
  def destroy
    @bird.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bird
    @bird = Bird.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bird_params
    params.fetch(:bird, {}).permit(:common_name, :latin_name)
  end
end
