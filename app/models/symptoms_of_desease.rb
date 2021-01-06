class SymptomsOfDesease < ApplicationRecord
  belongs_to :desease
  belongs_to :symptom
end
