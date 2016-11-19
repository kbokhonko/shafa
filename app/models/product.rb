class Product < ActiveRecord::Base
  has_many :images
  belongs_to :category

  validates :name, :category_id, presence: true
end
