class CreateOptionplans < ActiveRecord::Migration[6.0]
  def change
    create_table :optionplans do |t|
      t.references :company, null: false, foreign_key: true
      t.references :stockplan, null: false, foreign_key: true
      t.references :resolution, null: false, foreign_key: true
      t.string :plan_title
      t.date :plan_date
      t.integer :shares_allocated
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
