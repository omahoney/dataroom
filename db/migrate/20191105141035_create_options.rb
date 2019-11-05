class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :optionplan, null: false, foreign_key: true
      t.references :valuation, null: false, foreign_key: true
      t.references :resolution, null: false, foreign_key: true
      t.string :title
      t.date :grant_date
      t.string :option_type
      t.boolean :early_exercise
      t.integer :vesting_term
      t.integer :granted
      t.integer :exercised
      t.decimal :fmv
      t.decimal :strike_price
      t.string :status
      t.integer :forfeited
      t.integer :canceled
      t.integer :outstanding
      t.integer :cliff
      t.boolean :active

      t.timestamps
    end
  end
end
