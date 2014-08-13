#encoding: utf-8
class ManipsController < ApplicationController
  before_action :set_manip, only: [:show, :edit, :update, :destroy, :verif, :verifx]

  # GET /manips
  # GET /manips.json
  def index
    @manips = Manip.order(date: :desc).to_a
  end

  # GET /manips/1
  # GET /manips/1.json
  def show
  end

  # GET /manips/new
  def new
    @manip = Manip.new
    Boul.all.each do |b|
      @manip.valeurs.new(boul_id: b.id, manip_id: @manip.id)
    end
  end

  # GET /manips/1/edit
  def edit
  end

  # POST /manips
  # POST /manips.json
  def create
    @manip = Manip.new(manip_params)

    respond_to do |format|
      if @manip.save
        format.html { redirect_to manips_url, notice: {status: 'success', message: 'La manip a été créée.' }}
        format.json { render action: 'show', status: :created, location: @manip }
      else
        format.html { render action: 'new' }
        format.json { render json: @manip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manips/1
  # PATCH/PUT /manips/1.json
  def update
    respond_to do |format|
      if @manip.update(manip_params)
        format.html { redirect_to manips_url, notice: {status: 'success', message: 'La manip a été mise à jour.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @manip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manips/1
  # DELETE /manips/1.json
  def destroy
    @manip.destroy
    respond_to do |format|
      format.html { redirect_to manips_url }
      format.json { head :no_content }
    end
  end

  def verif
    @presences = @manip.presences.order(created_at: :desc)
  end

  def verifx
    @pgs = Pg.all
    @presences = @manip.presences.order(created_at: :desc)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manip
      @manip = Manip.includes(:valeurs).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manip_params
      params.require(:manip).permit(:nom, :lieu, :date, valeurs_attributes: [ :id, :manip_id, :boul_id, :point ])
    end
end
