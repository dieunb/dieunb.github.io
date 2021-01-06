# frozen_string_literal: true

class Product < ActiveRecord::Base
  primary_key = 'product_id'

  belongs_to :user
  belongs_to :category

  validates :product_id, presence: true
  validates :product_name, presence: true, length: { in: 5..50 }
  validates :discontinued, presence: true

  validates_with CategoryValidator

=begin
  validate :make_sure_exited_category=end

  private

  def make_sure_exited_category
    if self.category_id
      category = Category.find_by category_id: self.category_id
      unless category
        # return an error
        self.errors.add :category_id, 'can\'t be existed'
      end
    else
      self.errors.add :category_id, 'can\'t be blank'
    end
  end
=end
end
