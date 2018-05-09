class Article < ApplicationRecord
  belongs_to :category
  validates :url,  presence: true
  validates :category, presence: true
end
