#encoding: utf-8
class BoulsController < ApplicationController
  before_action :set_boul, only: [:show, :edit, :update, :destroy]

  # GET /bouls
  # GET /bouls.json
  def index
    @bouls = Boul.all
  end

  # GET /bouls/1
  # GET /bouls/1.json
  def show
  end

  # GET /bouls/new
  def new
    @boul = Boul.new
  end

  # GET /bouls/1/edit
  def edit
  end

  # POST /bouls
  # POST /bouls.json
  def create
    @boul = Boul.new(boul_params)

    respond_to do |format|
      if @boul.save
        format.html { redirect_to bouls_url, notice: {status: 'success', message: 'Création du Boul\'ss réussie.' }}
        format.json { render action: 'show', status: :created, location: @boul }
      else
        format.html { render action: 'new' }
        format.json { render json: @boul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bouls/1
  # PATCH/PUT /bouls/1.json
  def update
    respond_to do |format|
      if @boul.update(boul_params)
        format.html { redirect_to bouls_url, notice: {status: 'success', message: 'MAJ du Boul\'ss réussie.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @boul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bouls/1
  # DELETE /bouls/1.json
  def destroy
    @boul.destroy
    respond_to do |format|
      format.html { redirect_to bouls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boul
      @boul = Boul.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boul_params
      params.require(:boul).permit(:nom)
    end
end
