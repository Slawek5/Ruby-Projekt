json.extract! order, :id, :customer_id, :status, :ordered_at, :shipped_at, :created_at, :updated_at
json.url order_url(order, format: :json)
