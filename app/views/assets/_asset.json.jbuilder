json.extract! asset, :id, :name, :description, :user_id, :created_at, :updated_at
json.url asset_url(asset, format: :json)
