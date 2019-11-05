class CreateAdvisors < ActiveRecord::Migration[6.0]
  def change
    create_table :advisors do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :board
      t.date :start_date
      t.string :term
      t.string :compensation
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
