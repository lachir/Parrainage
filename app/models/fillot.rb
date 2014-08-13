class Fillot < ActiveRecord::Base
	belongs_to :pg
	belongs_to :semaine
	belongs_to :onscrit
end
