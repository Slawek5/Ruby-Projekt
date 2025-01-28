class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status
      t.datetime :ordered_at
      t.datetime :shipped_at

      t.timestamps
    end
  end
end
