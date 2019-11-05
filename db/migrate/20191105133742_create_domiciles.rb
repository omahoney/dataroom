class CreateDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :domiciles do |t|
      t.references :company, null: false, foreign_key: true
      t.string :domicile_locus
      t.string :domicile_type
      t.string :domicile_number
      t.string :address
      t.string :city
      t.string :zip
      t.string :county
      t.string :state
      t.string :country
      t.string :agent
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
