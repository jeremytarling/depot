class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :image_url
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|jpeg|png)$}i,
    message: 'must be a URL for a .gif, .jpeg or .png image'
  }
end
