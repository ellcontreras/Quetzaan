json.extract! checkout, :id, :products_id, :total_amount, :user_id, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
