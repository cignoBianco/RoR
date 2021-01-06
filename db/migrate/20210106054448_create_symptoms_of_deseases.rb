class CreateSymptomsOfDeseases < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms_of_deseases do |t|
      t.references :desease, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
