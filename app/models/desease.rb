class Desease < ApplicationRecord
  has_many :symptoms_of_desease, dependent: :destroy
  has_many :symptoms, through: :symptoms_of_desease, dependent: :destroy
  

end


