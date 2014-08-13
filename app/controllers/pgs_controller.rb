#encoding: utf-8
class PgsController < ApplicationController
  before_action :set_pg, only: [:edit, :update, :destroy]
  skip_before_action :check_level_1, only: [:login, :beforelogin]
  skip_before_action :check_level_2, except: [:new, :create, :destroy, :check, :checkforverifx, :uncheckforverifx]

  # GET /pgs
  # GET /pgs.json
  def index
    @pgs = []
    pgs = Pg.includes(:boul, :prepa, presences: [manip: [:valeurs]]).load
    pgs.each do |pg|
      points = 0
      pres = 0
      pg.presences.each do |p|
        pres += 1
        p.manip.valeurs.each do |v|
          if v.boul_id == pg.boul_id
            points += v.point            
          end
        end
      end
      i = 0
      while /^[\d]+(\.[\d]+){0,1}$/ === pg.fam[i] # adios les micro et deuxiemes fams
        i+=1
      end
      fixnum = ""
      if i < 3
        fixnum+="0"
      end
      if i < 2
        fixnum+="0"
      end
      if pg.fam[0..3] == 'XLVI'
        num = "046"
      elsif pg.fam[0..3] == '68+1'
        num = "069"
      else
        num = fixnum+pg.fam[0..i-1]
      end
      @pgs << {pg: pg, points: points, num: num, pres: pres}
      @pgs.sort! { |a,b| a[:num] <=> b[:num] }
    end
  end

  # GET /pgs/1
  # GET /pgs/1.json
  def show
    @pg = Pg.includes(:boul, :prepa, presences: [manip: [:valeurs]]).find(params[:id])
    @manips = Manip.all
  end

  # GET /pgs/new
  def new
    @pg = Pg.new
  end

  # GET /pgs/1/edit
  def edit
    unless (session[:pg_id] == @pg.id || session[:pg_level] > 1)
      redirect_to root_path, notice: {status: 'error', message: 'Fuck you hacker.' }
    end
  end

  # POST /pgs
  # POST /pgs.json
  def create
    @pg = Pg.new(pg_params)
    @pg.level = 1
    respond_to do |format|
      if @pg.save
        format.html { redirect_to @pg, notice: {status: 'success', message: 'Création du profil PG réussie.' }}
        format.json { render action: 'show', status: :created, location: @pg }
      else
        format.html { render action: 'new' }
        format.json { render json: @pg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pgs/1
  # PATCH/PUT /pgs/1.json
  def update
    if (session[:pg_id] == @pg.id || session[:pg_level] > 1)
      respond_to do |format|
        if @pg.update(pg_params)
          format.html { redirect_to @pg, notice: {status: 'success', message: 'Le profil du PG a été mis à jour.' }}
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @pg.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: {status: 'error', message: 'Fuck you hacker.' }
    end
  end

  # DELETE /pgs/1
  # DELETE /pgs/1.json
  def destroy
    @pg.destroy
    respond_to do |format|
      format.html { redirect_to pgs_url }
      format.json { head :no_content }
    end
  end

  def check
    pg = Pg.find_by barcode: params[:barcode]
    if pg
      if Presence.find_by pg_id: pg.id, manip_id: params[:manip_id]
        render json: {status: "error", data: "PG d%C3%A9j%C3%A0 scann%C3%A9"}
      else
        presence = Presence.new(manip_id: params[:manip_id], pg_id: pg.id)
        unless presence.save
          render json: {status: "error", data: "Pr%C3%A9sence non sauvegard%C3%A9e, veuillez recommencer"}
        end
        render json: {status: "ok", data: {bucque: pg.bucque, fam: pg.fam}}
      end
    else
      render json: {status: "error", data: "PG inconnu"}
    end
  end

  def checkforverifx
    presence = Presence.new
    presence.pg_id = params[:id]
    presence.manip_id = params[:manip_id]
    if presence.save
      render json: {status: "ok"}
    else
      render json: {status: "error" }
    end
  end

  def uncheckforverifx
    presence = Presence.find_by pg_id: params[:id], manip_id: params[:manip_id]
    if presence.destroy
      render json: {status: "ok"}
    else
      render json: {status: "error" }
    end
  end

  def beforelogin
  end

  def login
    pg = Pg.find_by fam: params[:fam]
    if pg && pg.authenticate(params[:password])
      session[:pg_id]    = pg.id
      session[:pg_level] = pg.level
      session[:pg_name]  = pg.bucque + ' ' + pg.fam
      redirect_to root_path, notice: {status: 'success', message: "Connexion réussie" }
    else
      redirect_to beforelogin_path, notice: {status: 'error', message: "Fam'ss ou mot de passe incorrect"}
    end
  end

  def logout
    session[:pg_id]    = nil
    session[:pg_level] = nil
    session[:pg_name]  = nil
    redirect_to root_url, notice: {status: 'success', message: "Déconnexion réussie"}
  end

  def punchlines
    @pgs = Pg.all
    @pgs.shuffle!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pg
      @pg = Pg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pg_params
      params.require(:pg).permit(:nom, :prenom, :bucque, :fam, :saque, :bio, :biocit, :comment, :tel, :barcode, :naissance, :boul_id, :prepa_id, :password, :password_confirmation)
    end
end
