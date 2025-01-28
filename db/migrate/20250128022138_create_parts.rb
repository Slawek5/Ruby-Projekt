class CreateParts < ActiveRecord::Migration[8.0]
  def change
    create_table :parts do |t|
      t.string :title
      t.string :sku
      t.text :description
      t.string :status
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
