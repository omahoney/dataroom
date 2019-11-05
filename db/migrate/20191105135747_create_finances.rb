class CreateFinances < ActiveRecord::Migration[6.0]
  def change
    create_table :finances do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :stockplan, null: false, foreign_key: true
      t.string :title
      t.date :doc_date
      t.string :description
      t.string :category
      t.string :status
      t.boolean :complete
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
