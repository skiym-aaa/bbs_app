class Post < ApplicationRecord
  belongs_to :user
  has_many :post_responses

  validates :title, presence: true
  validates :article_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
end
