class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.references :company, null: false, foreign_key: true
      t.string :ref
      t.string :category
      t.string :description
      t.string :version
      t.date :doc_date
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
