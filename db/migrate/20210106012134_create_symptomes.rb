class CreateSymptomes < ActiveRecord::Migration[6.1]
  def change
    create_table :symptomes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
