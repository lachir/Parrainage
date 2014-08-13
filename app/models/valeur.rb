class Valeur < ActiveRecord::Base
	belongs_to :manip
	belongs_to :boul

	#default_scope ->{ includes(:boul) } #si tu aimes le sql tape dans tes mains clap clap

	#validates_presence_of :manip_id, message: "La manip ne peut rester vide."
	validates_presence_of :boul_id, message: "Le boul'ss ne peut rester vide."
	validates_presence_of :point, message: "Le point ne peut rester vide."
	validates_numericality_of :point, message: "Nombre de point incorrect."
end
