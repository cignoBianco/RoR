class Desease < ApplicationRecord
  has_many :symptoms_of_desease
  has_many :symptoms, through: :symptoms_of_desease
  

end


