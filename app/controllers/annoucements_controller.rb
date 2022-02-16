class AnnoucementsController < ApplicationController
  before_action :get_sport
  before_action :set_annoucement, only: %i[ show edit update destroy ]

  # GET /annoucements or /annoucements.json
  def index
    #@annoucements = Annoucement.all
    @annoucements = @sport.annoucements
  end

  # GET /annoucements/1 or /annoucements/1.json
  def show
  end

  # GET /annoucements/new
  def new
   # @annoucement = Annoucement.new
    @annoucement = @sport.annoucements.build
  end

  # GET /annoucements/1/edit
  def edit
  end

  # POST /annoucements or /annoucements.json
  def create
    @annoucement = @sport.annoucements.build(annoucement_params)

    respond_to do |format|
      if @annoucement.save
        format.html { redirect_to sport_annoucements_path(@sport), notice: "Annoucement was successfully created." }
        format.json { render :show, status: :created, location: @annoucement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoucements/1 or /annoucements/1.json
  def update
    respond_to do |format|
      if @annoucement.update(annoucement_params)
        format.html { redirect_to sport_annoucement_path(@sport), notice: "Annoucement was successfully updated." }
        format.json { render :show, status: :ok, location: @annoucement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoucements/1 or /annoucements/1.json
  def destroy
    @annoucement.destroy

    respond_to do |format|
      format.html { redirect_to sport_annoucements_path(@sport), notice: "Annoucement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_sport
      @sport= Sport.find(params[:sport_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_annoucement
      @annoucement = @sport.annoucements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def annoucement_params
      params.require(:annoucement).permit(:message, :sport_id)
    end
end
