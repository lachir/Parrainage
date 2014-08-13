class Manip < ActiveRecord::Base
	has_many :valeurs, dependent: :destroy
	has_many :presences, dependent: :destroy
	accepts_nested_attributes_for :valeurs

	def self.default_scope
		#includes(:valeurs)
		order(date: :desc)
	end

	validates_presence_of :nom, message: "Le nom ne peut rester vide."
end
