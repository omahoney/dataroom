class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :company, null: false, foreign_key: true
      t.string :contractor
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.date :start_date
      t.date :end_date
      t.string :term
      t.string :terms
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
