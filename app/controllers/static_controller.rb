#encoding: utf-8
class StaticController < ApplicationController
  #Pas vraiment statique :)
  skip_before_action :check_level_1
  skip_before_action :check_level_2, except: [:barcodes, :admins]

  def home
  end

  def infos
  end

  def barcodes
    @pgs = Pg.order(bucque: :asc).all
    render layout: 'blanklayout'
  end

  def admins
  	@admins = Pg.where('level > 1').order(level: :desc)
    @pgs = Pg.order(bucque: :asc).all
  end

  def set_admin
    if (session[:pg_level] && session[:pg_level] > 2)
      pg = Pg.find_by id: params[:pg_id]
      if pg
        pg.update_attribute(:level, params[:level])
        redirect_to admins_path, notice: {status: 'success', message: 'Un nouvel admin a été créé.'}
      else
        redirect_to admins_path, notice: {status: 'error', message: 'PG non trouvé.'}
      end
    else
      redirect_to root_path, notice: {status: 'error', message: 'Tu ne disposes pas des droits suffisants.'}
    end
  end

end
