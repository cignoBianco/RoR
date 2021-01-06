class CreateDeseases < ActiveRecord::Migration[6.1]
  def change
    create_table :deseases do |t|
      t.string :title
      t.string :body_part
      t.text :description

      t.timestamps
    end
  end
end
