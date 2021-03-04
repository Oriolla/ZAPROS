class NirsController < ApplicationController
  before_action :set_nir, only: [:show, :edit, :update, :destroy]

  # GET /nirs
  # GET /nirs.json
  def index
    @nirs = Nir.all.order(v: :asc)
  end

  # GET /nirs/1
  # GET /nirs/1.json
  def show
  end

  # GET /nirs/new
  def new
    @nir = Nir.new
  end

  # GET /nirs/1/edit
  def edit
  end

  # POST /nirs
  # POST /nirs.json
  def create
    @nir = Nir.new(nir_params)

    respond_to do |format|
      if @nir.save
        format.html { redirect_to @nir, notice: 'Nir was successfully created.' }
        format.json { render :show, status: :created, location: @nir }
      else
        format.html { render :new }
        format.json { render json: @nir.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nirs/1
  # PATCH/PUT /nirs/1.json
  def update
    respond_to do |format|
      if @nir.update(nir_params)
        format.html { redirect_to @nir, notice: 'Nir was successfully updated.' }
        format.json { render :show, status: :ok, location: @nir }
      else
        format.html { render :edit }
        format.json { render json: @nir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nirs/1
  # DELETE /nirs/1.json
  def destroy
    @nir.destroy
    respond_to do |format|
      format.html { redirect_to nirs_url, notice: 'Nir was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nir
      @nir = Nir.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nir_params
      params.require(:nir).permit(:name, :university_id, :assessment1_id, :assessment2_id, :assessment3_id, :v)
    end
end
