class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :email
      t.string :phone
      t.string :person_type
      t.boolean :active

      t.timestamps
    end
  end
end
