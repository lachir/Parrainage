class Boul < ActiveRecord::Base
	has_many :pgs

	validates_presence_of :nom, message: "Le nom ne peut rester vide."
	validates_uniqueness_of :nom, message: "Nom deja pris"
end
