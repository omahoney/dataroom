class CreateStockholders < ActiveRecord::Migration[6.0]
  def change
    create_table :stockholders do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :status
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
