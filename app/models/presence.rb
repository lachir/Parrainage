class Presence < ActiveRecord::Base
	belongs_to :manip
	belongs_to :pg

	#default_scope ->{ includes(:manip) }
	scope :avecpg, -> { includes(:pg) }

	validates_presence_of :manip_id, message: "La manip ne peut rester vide"
	validates_presence_of :pg_id, message: "Le pg ne peut rester vide"
end
