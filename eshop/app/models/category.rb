class Category < ApplicationRecord
  has_many :products

  belongs_to :parent_category, class_name: Category.name, foreign_key: :parent_id, optional: true
  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
end
