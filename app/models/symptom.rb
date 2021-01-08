class Symptom < ApplicationRecord

  has_many :symptoms_of_desease, dependent: :destroy
  has_many :deseases, through: :symptoms_of_desease, dependent: :destroy

end
