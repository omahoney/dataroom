class CreateDashboards < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboards do |t|
      t.references :company, null: false, foreign_key: true
      t.string :description
      t.string :contact
      t.date :deadline
      t.date :completed
      t.boolean :active
      t.text :notes


      t.timestamps
    end
  end
end
