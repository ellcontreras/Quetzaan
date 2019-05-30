json.extract! userdata_checkout, :id, :user_id, :checkout_id, :name, :street, :external_number, :internal_number, :country, :zip_code, :state, :city, :created_at, :updated_at
json.url userdata_checkout_url(userdata_checkout, format: :json)
