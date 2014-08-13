class Sondage < ActiveRecord::Base
	has_many :votes, dependent: :destroy
	accepts_nested_attributes_for :votes

	validates_presence_of :nom, message: "Le nom ne peut rester vide."
	validates_presence_of :startdate, message: "La date de debut ne peut rester vide."
	validates_presence_of :enddate, message: "La date de fin ne peut rester vide."
end
