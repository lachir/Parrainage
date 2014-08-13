class Pg < ActiveRecord::Base
	belongs_to :prepa
	belongs_to :boul
	has_many :presences, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :fillots, dependent: :destroy
	#has_secure_password

	#default_scope ->{ includes(:boul, :prepa) }

	after_validation :validate_fams
	before_create :set_barcode

  	validates_presence_of :password, on: :create, message: "Le mot de passe ne peut rester vide"
	validates_presence_of :nom, message: "Le nom ne peut rester vide."
	validates_presence_of :prenom, message: "Le prenom ne peut rester vide."
	validates_presence_of :bucque, message: "La bucque ne peut rester vide."
	validates_presence_of :fam, message: "La fam'ss ne peut rester vide."
	validates_presence_of :naissance, message: "La date de naissance ne peut rester vide."
	validates_presence_of :prepa_id, message: "La prepa ne peut rester vide."
	validates_presence_of :boul_id, message: "Le boul'ss ne peut rester vide."
	validates_uniqueness_of :fam, message: "Fam'ss deja prise."

	def validate_fams
		j = 0
		while /^[\d]+(\.[\d]+){0,1}$/ === self.fam[j] # vive les regular expressions
			j+=1
		end
		if self.fam[0..3] == 'XLVI'
			j = 4
		end
		errors.add('Fam\'ss', 'Fam\'ss incorrecte') if j==0 || self.fam[0..j-1].to_i > 183
	end

	def set_barcode
		# (Joü)² 111 => J1111234, Se²one² 134µ109 => S1341234, michet 99µlol => M9912345 ou 1234(5,6) est random
		i = 0
		j = 0
		until self.bucque[i].match(/[[:alpha:]]/) # adios la ponctuation
			i+=1
		end
		while /^[\d]+(\.[\d]+){0,1}$/ === self.fam[j] # adios les micro et deuxiemes fams
			j+=1
		end
		if self.fam[0..3] == 'XLVI'
			j = 4
		end
		k = 10**(6 - j)
		self.barcode = self.bucque[i].upcase+self.fam[0..j-1]+rand(k..10*k).to_s
	end
end
