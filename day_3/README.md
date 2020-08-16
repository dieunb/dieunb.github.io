# Design database

![design database](https://cacoo.com/diagrams/0lpzpe7Wgiif3xTI-8D104.png)

# Migration and models

## Review

```
rails g model Review content:string rating:float product_id:integer user_id:integer
```

```
# app/models/review.rb

class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
```

## Product
```
# app/models/product.rb

class Product < ApplicationRecord
  has_many :reviews
end
```

## User
```
# app/models/user.rb

class User < ApplicationRecord
  has_many :reviews
end
```

# Implement controllers/views

```
# app/controllers/reviews_controller.rb

class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def create
    @review = Review.new review_params
    @review.user = current_user

    if @review.save

    else

    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :product_id)
  end
end
```

# Update rake task
https://github.com/ruby/rake

```
# lib/tasks/db.rake
namespace :db do
  desc "todo"
  task fake_data: :environment do
    # add your crazy code
  end
end
```

# Unit test

- Generate controller spec for `reviews_controller`

```
rails g rspec:controller Reviews --controller-specs --no-request-specs --no-view-specs
```

- Write unit test

```
# app/spec/controllers/reviews_controller_spec.rb

require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  describe "#create" do
    before do
      cateogry = Category.create(name: 'Laptop')
      product = Product.create(name: 'Macbook pro 2015', price: 2500, quantity: 3, category: category)
    end

    it "returns http success" do
      post :create, params: { review: { content: 'Hehehahahihi', rating: 5, product_id: product.id)
      expect(product.reviews.count).to eql(1)
    end
  end
end
```

- Execute unit test

```
bundle exec rspec
```
