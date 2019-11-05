class CreateStockplans < ActiveRecord::Migration[6.0]
  def change
    create_table :stockplans do |t|
      t.references :company, null: false, foreign_key: true
      t.references :resolution, null: false, foreign_key: true
      t.string :stock_class
      t.string :series
      t.date :date_authorized
      t.decimal :par_value
      t.integer :shares_authorized
      t.integer :shares_issuable
      t.integer :shares_reserved
      t.string :rights
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
