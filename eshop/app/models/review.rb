class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :comments, dependent: :destroy

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, length: { in: 10..120 }
end
