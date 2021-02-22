class Api::BirdsController < ApplicationController
  before_action :set_bird, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /birds or /birds.json
  def index
    @birds = Bird.all
    respond_to do |format|
      format.json { render json: @birds, status: 200 }
    end
  end

  # GET /birds/1 or /birds/1.json
  def show
    @bird = Bird.find(params[:id])
    respond_to do |format|
      if @bird
        format.json { render json: @bird, status: :ok }
      else
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /birds/new
  def new
    @bird = Bird.new
  end

  # POST /birds or /birds.json
  def create
    @bird = Bird.new(bird_params)

    respond_to do |format|
      if @bird.save
        format.json { render :show, status: :created, location: @bird }
      else
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /birds/1 or /birds/1.json
  def update
    respond_to do |format|
      if @bird.update(bird_params)
        format.json { render :show, status: :ok, location: @bird }
      else
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birds/1 or /birds/1.json
  def destroy
    @bird.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
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
