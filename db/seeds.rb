# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
deseases = Desease.create([{ title: 'Desease 1', description: 'Description 1', body_part: 'HEAD'},{title: 'Desease 2', description: 'description 2', body_part: 'ARM'}, {title: 'Desease 3', description: 'Description 3', body_part: 'HEAD'}, {title: 'Desease 4', description: 'Description 4', body_part: 'Body_part 4'}])

symptoms = Symptom.create([{title: 'Symptom 1', description: 'Description 1'}, {title: 'Symptom 2', description: 'Symptoms description 2'}])

desease_symptoms = Symptoms_of_deseases.create([{desease_id: 1, symptom_id: 1},
  {desease_id: 1, symptom_id: 2},
  {desease_id: 2, symptom_id: 3},
  {desease_id: 3, symptom_id: 3},
  {desease_id: 3, symptom_id: 1}])
