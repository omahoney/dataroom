class CreateResolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :resolutions do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.date :doc_date
      t.string :description
      t.string :status
      t.string :party
      t.string :res_category
      t.string :res_type
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
