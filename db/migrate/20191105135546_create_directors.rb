class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :resolution, null: false, foreign_key: true
      t.string :director_class
      t.integer :term
      t.date :start_date
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
