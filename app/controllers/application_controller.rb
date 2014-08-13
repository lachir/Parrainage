#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_level_1, :check_level_2, :list_pg_from_cache

  def check_level_1
  	unless session[:pg_level]
  		redirect_to beforelogin_path, notice: { status: "error", message: "Tu dois te connecter."}
  	end
  end

  def check_level_2
  	unless session[:pg_level] && session[:pg_level] > 1
  		redirect_to root_path, notice: { status: "error", message: "Tu ne disposes pas des droits suffisants."}
  	end
  end

  def list_pg_from_cache
	@recherche = Rails.cache.fetch("recherche", expires_in: 1.day) do
		pgs = Pg.all
		onscrits = Onscrit.all
		data = {}
		i = 0
		pgs.each do |p|
			data[i] = {}
			data[i][:label] = p.prenom+' '+p.nom
			data[i][:url] = url_for p
			i += 1
			data[i] = {}
			data[i][:label] = p.bucque+' '+p.fam
			data[i][:url] = url_for p
			i += 1
		end
		onscrits.each do |o|
			data[i] = {}
			data[i][:label] = o.prenom+' '+o.nom
			data[i][:url] = url_for o
			i += 1
		end
		data
	end
  end

end
