#encoding: utf-8
class OnscritsController < ApplicationController
  before_action :set_onscrit, only: [:show, :edit, :update, :destroy]
  #skip_before_action :check_level_1
  skip_before_action :check_level_2, except: [:new, :edit, :update, :destroy, :create]

  # GET /onscrits
  # GET /onscrits.json
  def index
    @onscrits = Onscrit.includes(:prepa).order(nom: :asc).to_a
  end

  def learnonscrits
    @onscrits = Onscrit.all
    @onscrits.shuffle!
  end

  def learnonscritsreverse
    @onscrits = Onscrit.all
    @onscrits.shuffle!
  end

  # GET /onscrits/1
  # GET /onscrits/1.json
  def show
  end

  # GET /onscrits/new
  def new
    @onscrit = Onscrit.new
  end

  # GET /onscrits/1/edit
  def edit
  end

  # POST /onscrits
  # POST /onscrits.json
  def create
    @onscrit = Onscrit.new(onscrit_params)

    respond_to do |format|
      if @onscrit.save
        format.html { redirect_to onscrits_url, notice: {status: 'success', message: 'Création du .onscrit réussie.' }}
        format.json { render action: 'show', status: :created, location: @onscrit }
      else
        format.html { render action: 'new' }
        format.json { render json: @onscrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onscrits/1
  # PATCH/PUT /onscrits/1.json
  def update
    respond_to do |format|
      if @onscrit.update(onscrit_params)
        format.html { redirect_to onscrits_url, notice: {status: 'success', message: 'MAJ du .onscrit réussie.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @onscrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onscrits/1
  # DELETE /onscrits/1.json
  def destroy
    @onscrit.destroy
    respond_to do |format|
      format.html { redirect_to onscrits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onscrit
      @onscrit = Onscrit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onscrit_params
      params.require(:onscrit).permit(:nom, :prenom, :naissance, :photo, :num, :prepa_id)
    end
end
