class TwoCriteriaController < ApplicationController
  before_action :set_two_criterium, only: [:show, :edit, :update, :destroy]

  # GET /two_criteria
  # GET /two_criteria.json
  def index
    @two_criteria = TwoCriterium.all.order(id: :asc)
  end

  # GET /two_criteria/1
  # GET /two_criteria/1.json
  def show
  end

  # GET /two_criteria/new
  def new
    @two_criterium = TwoCriterium.new
  end

  # GET /two_criteria/1/edit
  def edit
  end

  # POST /two_criteria
  # POST /two_criteria.json
  def create
    @two_criterium = TwoCriterium.new(two_criterium_params)

    respond_to do |format|
      if @two_criterium.save
        format.html { redirect_to @two_criterium, notice: 'Two criterium was successfully created.' }
        format.json { render :show, status: :created, location: @two_criterium }
      else
        format.html { render :new }
        format.json { render json: @two_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /two_criteria/1
  # PATCH/PUT /two_criteria/1.json
  def update
    respond_to do |format|
      if @two_criterium.update(two_criterium_params)
        format.html { redirect_to @two_criterium, notice: 'Two criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @two_criterium }
      else
        format.html { render :edit }
        format.json { render json: @two_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /two_criteria/1
  # DELETE /two_criteria/1.json
  def destroy
    @two_criterium.destroy
    respond_to do |format|
      format.html { redirect_to two_criteria_url, notice: 'Two criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_two_criterium
      @two_criterium = TwoCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def two_criterium_params
      params.require(:two_criterium).permit(:criteria1_id, :criteria2_id, :uses)
    end
end
