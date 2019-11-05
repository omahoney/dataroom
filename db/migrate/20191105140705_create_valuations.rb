class CreateValuations < ActiveRecord::Migration[6.0]
  def change
    create_table :valuations do |t|
      t.references :company, null: false, foreign_key: true
      t.references :stockplan, null: false, foreign_key: true
      t.string :title
      t.decimal :price
      t.string :event
      t.string :provider
      t.date :valuation_date
      t.date :safeharbor_date
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
