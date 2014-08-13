class Onscrit < ActiveRecord::Base
	belongs_to :prepa
	has_many :votes, dependent: :destroy
	has_many :fillots, dependent: :destroy
	has_attached_file :photo, styles: { large: "600x600>", thumb: "150x150>", medium: "350x350>" }

	#default_scope ->{ includes(:prepa) }

	validates_presence_of :nom, message: "Le nom ne peut rester vide."
	#validates_presence_of :prenom, message: "Le prenom ne peut rester vide."
	#validates_presence_of :naissance, message: "La date de naissance ne peut rester vide."
	#validates_uniqueness_of :num, message: "Num\'s deja pris."
	#validates_numericality_of :num, message: "Num\'s de monome incorrect"

	validates_attachment_size :photo, less_than: 3.megabytes
	validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']

	def nom_complet
		self.nom + ' ' + self.prenom
	end
end
