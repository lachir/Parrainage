#encoding: utf-8
class SemainesController < ApplicationController
  before_action :set_semaine, only: [:show, :edit, :update, :destroy]

  # GET /semaines
  # GET /semaines.json
  def index
    @semaines = Semaine.all
  end

  # GET /semaines/1
  # GET /semaines/1.json
  def show
  end

  # GET /semaines/new
  def new
    @semaine = Semaine.new
  end

  # GET /semaines/1/edit
  def edit
  end

  # POST /semaines
  # POST /semaines.json
  def create
    @semaine = Semaine.new(semaine_params)

    respond_to do |format|
      if @semaine.save
        format.html { redirect_to semaines_path, notice: {status: 'success', message: 'La semaine a été créée.' }}
        format.json { render action: 'show', status: :created, location: @semaine }
      else
        format.html { render action: 'new' }
        format.json { render json: @semaine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semaines/1
  # PATCH/PUT /semaines/1.json
  def update
    respond_to do |format|
      if @semaine.update(semaine_params)
        format.html { redirect_to semaines_path, notice: {status: 'success', message: 'La semaine a été MAJ.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @semaine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semaines/1
  # DELETE /semaines/1.json
  def destroy
    @semaine.destroy
    respond_to do |format|
      format.html { redirect_to semaines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semaine
      @semaine = Semaine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semaine_params
      params.require(:semaine).permit(:nom, :description, :startdate, :enddate)
    end
end
