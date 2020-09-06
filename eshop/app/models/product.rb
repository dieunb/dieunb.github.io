class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy

  def calculate_rating
    avg_rating = self.reviews.average(:rating).to_i
    self.update(aggregate_rating: avg_rating)
  end
end
