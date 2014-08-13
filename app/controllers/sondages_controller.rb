#encoding: utf-8
class SondagesController < ApplicationController
  before_action :set_sondage, only: [:show, :edit, :update, :destroy]
  before_action :set_sondage_with_votes, only: [:review]
  skip_before_action :check_level_2, except: [:new, :edit, :update, :destroy, :create, :review]

  # GET /sondages
  # GET /sondages.json
  def index
    @sondages = Sondage.all
  end

  # GET /sondages/1
  # GET /sondages/1.json
  def show
    @onscrits = Onscrit.order(nom: :asc).to_a
    @votes = Vote.where('pg_id ='+session[:pg_id].to_s+' AND sondage_id ='+@sondage.id.to_s).to_a
  end

  # GET /sondages/new
  def new
    @sondage = Sondage.new
  end

  # GET /sondages/1/edit
  def edit
  end

  # POST /sondages
  # POST /sondages.json
  def create
    @sondage = Sondage.new(sondage_params)

    respond_to do |format|
      if @sondage.save
        format.html { redirect_to sondages_path, notice: {status: 'success', message: 'Le sondage a été créé.' }}
        format.json { render action: 'show', status: :created, location: @sondage }
      else
        format.html { render action: 'new' }
        format.json { render json: @sondage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sondages/1
  # PATCH/PUT /sondages/1.json
  def update
    respond_to do |format|
      if @sondage.update(sondage_params)
        format.html { redirect_to sondages_path, notice: {status: 'success', message: 'Le sondage a été MAJ.' }}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sondage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sondages/1
  # DELETE /sondages/1.json
  def destroy
    @sondage.destroy
    respond_to do |format|
      format.html { redirect_to sondages_url }
      format.json { head :no_content }
    end
  end

  def vote
    i = 1
    a = []
    sondage = Sondage.find(params[:sondage_id])
    sondage.nbchoix.times do 
      a[i-1] = params['vote'+i.to_s][:onscrit_id]
      i += 1
    end
    if a != a.uniq
      redirect_to sondage, notice: {status: 'error', message:'Les différents voeux doivent être distincts.'} 
    else
      precedentsvotes = Vote.where('pg_id ='+session[:pg_id].to_s+' AND sondage_id ='+sondage.id.to_s).to_a
      if precedentsvotes.any?
        precedentsvotes.each do |v|
          v.destroy
        end
      end
      i = 1
      sondage.nbchoix.times do 
        vote = Vote.new(sondage_id: params[:sondage_id], pg_id: session[:pg_id], onscrit_id: params['vote'+i.to_s][:onscrit_id], priorite: i)
        vote.save
        i += 1
      end
      redirect_to sondage, notice: {status: 'success', message:'Tes choix ont été enregistrés, merci d\'avoir voté!'} 
    end
  end

  def review
    @onscrits = Onscrit.order(nom: :asc).to_a
    @pgpoints = []
    pgs = Pg.includes(presences: [manip: [:valeurs]]).to_a
    pgs.each do |pg|
      points = 0
      pg.presences.each do |p|
        p.manip.valeurs.each do |v|
          if v.boul_id == pg.boul_id
            points += v.point            
          end
        end
      end
      @pgpoints << {pg: pg, points: points}
      @pgpoints.sort! { |a,b| b[:points] <=> a[:points] }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sondage
      @sondage = Sondage.find(params[:id])
    end

    def set_sondage_with_votes
      @sondage = Sondage.includes(votes: [:pg, :onscrit]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sondage_params
      params.require(:sondage).permit(:nom, :description, :nbchoix, :startdate, :enddate, votes_attributes: [:id, :pg_id, :onscrit_id, :priorite])
    end
end
