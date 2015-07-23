class AttractionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy, :upvote]

  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.user = current_user
    if @attraction.save
        redirect_to attractions_path, notice: "Attraction was successfully created."
    else
        render :new
    end
  end


  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  
    def update
        if @attraction.update(attraction_params)
           redirect_to attractions_path, notice: 'Attracction was successfully updated.'
        else
          render :edit
        end
    end

    def upvote 
      vote = @attraction.votes.new(user: current_user)
      if vote.save
        redirect_to attractions_path, notice: 'Attraction was successfully upvoted.'
      else
        redirect_to attractions_path, notice: "You've already voted"
      end
    end
    
  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :display_image_url, :parish, :age_range, :price, :attr_url, :description, :map_url, :user_id)
    end
end
