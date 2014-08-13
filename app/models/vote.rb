class Vote < ActiveRecord::Base
	belongs_to :pg
	belongs_to :onscrit
	belongs_to :sondage

	validates_presence_of :priorite, message: "La priorite ne peut rester vide."
	validates_numericality_of :priorite, message: "Priorite incorrecte"
end
