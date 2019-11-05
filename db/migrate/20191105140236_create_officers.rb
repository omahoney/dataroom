class CreateOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :officers do |t|
      t.references :company, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :resolution, null: false, foreign_key: true
      t.string :title
      t.boolean :jx_required
      t.boolean :active
      t.text :notes

      t.timestamps
    end
  end
end
