class CreateNdas < ActiveRecord::Migration[6.0]
  def change
    create_table :ndas do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.date :nda_date
      t.string :last_name
      t.string :first_name
      t.string :company_name
      t.string :capacity
      t.string :nda_type
      t.string :term
      t.string :status
      t.string :country
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
