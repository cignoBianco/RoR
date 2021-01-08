# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

symptoms = Symptom.create([
	{title: 'Symptom 1', description: 'Description 1'}, 
	{title: 'Symptom 2', description: 'Symptoms description 2'},
	{title: 'Symptom 3', description: 'Description 3'}, 
	{title: 'Symptom 4', description: 'Symptoms description 4'}])

deseases = Desease.create([
	{ title: 'Desease 1', description: 'Description 1', body_part: 'HEAD', symptom_ids: [symptoms[0].id, symptoms[2].id]},
	{title: 'Desease 2', description: 'description 2', body_part: 'ARM', symptom_ids: [symptoms[1].id, symptoms[2].id]}, 
	{title: 'Desease 3', description: 'Description 3', body_part: 'HEAD', symptom_ids: [symptoms[0].id, symptoms[1].id]}, 
	{title: 'Desease 4', description: 'Description 4', body_part: 'Body_part 4'}])
