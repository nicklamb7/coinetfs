json.extract! article, :id, :title, :description, :link, :date, :source, :asset_id, :etf_id, :created_at, :updated_at
json.url article_url(article, format: :json)
