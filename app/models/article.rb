class Article < ApplicationRecord
  belongs_to :asset
  belongs_to :etf
  belongs_to :user
end
