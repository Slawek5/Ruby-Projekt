class CreateJoinTableOrdersParts < ActiveRecord::Migration[8.0]
  def change
    create_join_table :orders, :parts do |t|
      # t.index [:order_id, :part_id]
      # t.index [:part_id, :order_id]
    end
  end
end
