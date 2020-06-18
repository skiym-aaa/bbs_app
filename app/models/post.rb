class Post < ApplicationRecord
  belongs_to :user
  has_many :post_responses
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  validates :title, presence: true
  validates :article_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
end
