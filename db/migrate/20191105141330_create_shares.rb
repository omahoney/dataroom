class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :stockplan, null: false, foreign_key: true
      t.string :certificate
      t.integer :shares_issued
      t.decimal :share_price
      t.decimal :cash
      t.date :issued_date
      t.boolean :restricted
      t.date :terminated_date
      t.string :domicile
      t.string :exemption
      t.string :reference
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
