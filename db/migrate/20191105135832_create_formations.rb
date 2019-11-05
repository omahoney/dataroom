class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.date :doc_date
      t.string :description
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
