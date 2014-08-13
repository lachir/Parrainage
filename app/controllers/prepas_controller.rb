#encoding: utf-8
class PrepasController < ApplicationController
  before_action :set_prepa, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_level_1, only: [:new, :create]
  skip_before_action :check_level_2, only: [:new, :create]

  # GET /prepas
  # GET /prepas.json
  def index
    @prepas = Prepa.all
  end

  # GET /prepas/1
  # GET /prepas/1.json
  def show
  end

  # GET /prepas/new
  def new
    @prepa = Prepa.new
  end

  # GET /prepas/1/edit
  def edit
  end

  # POST /prepas
  # POST /prepas.json
  def create
    @prepa = Prepa.new(prepa_params)

    respond_to do |format|
      if @prepa.save
        if not session[:pg_level]
          format.html { redirect_to new_pg_url, notice: {status: 'success', message: 'La prépa a été créée.' }}
        else
          format.html { redirect_to prepas_url, notice: {status: 'success', message: 'La prépa a été créée.' }}
          format.json { render action: 'show', status: :created, location: @prepa }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @prepa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prepas/1
  # PATCH/PUT /prepas/1.json
  def update
    respond_to do |format|
      if @prepa.update(prepa_params)
        format.html { redirect_to prepas_url, notice: {status: 'success', message: 'La prépa a été mise à jour.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prepa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepas/1
  # DELETE /prepas/1.json
  def destroy
    @prepa.destroy
    respond_to do |format|
      format.html { redirect_to prepas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prepa
      @prepa = Prepa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prepa_params
      params.require(:prepa).permit(:nom, :ville)
    end
end
