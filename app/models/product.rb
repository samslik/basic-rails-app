class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, :price, :image_url, :color, presence: true
  validates :price, numericality: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def views
    $redis.get("product:#{id}")
  end

  def viewed
    $redis.incr("product:#{id}")
  end

end
