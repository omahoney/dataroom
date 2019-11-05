class CreateConvertiblenotes < ActiveRecord::Migration[6.0]
  def change
    create_table :convertiblenotes do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :stockplan, null: false, foreign_key: true
      t.date :agreement_date
      t.date :note_date
      t.decimal :note_amount
      t.string :note_type
      t.date :maturity_date
      t.decimal :interest_rate
      t.decimal :discount_rate
      t.decimal :share_cap
      t.decimal :qualified_finance
      t.date :conversion_date
      t.boolean :converted
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
