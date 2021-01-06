class Symptom < ApplicationRecord

  has_many :symptoms_of_desease
  has_many :deseases, through: :symptoms_of_desease

end
