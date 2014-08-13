class Prepa < ActiveRecord::Base
	has_many :pgs
	has_many :onscrits
	validates :nom, format: { with: /[a-zA-z]|[0-9]|\s/, message: "Pas de caractere speciaux" }
	validates :ville, format: { with: /[a-zA-z]|[0-9]|\s/, message: "Pas de caractere speciaux" }
	validates_presence_of :nom, message: "Le nom ne peut rester vide."
	validates_presence_of :ville, message: "La ville ne peut rester vide."
	validates_uniqueness_of :nom, message: "Nom deja pris"

	def nom_complet
		self.nom + ' (' + self.ville + ')'
	end
end
