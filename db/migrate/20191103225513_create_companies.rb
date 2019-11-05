class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :shortname
      t.date :formation_date
      t.string :entity
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :email
      t.string :web
      t.string :fein
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
