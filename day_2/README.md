# Design database

![design database](https://cacoo.com/diagrams/0lpzpe7Wgiif3xTI-7C373.png)

# Implement models

## Category
```
# app/models/category.rb

class Category < ApplicationRecord
end
```

## Product
```
# app/models/product.rb

class Product < ApplicationRecord
end
```


# Implement controllers/views

```
# app/controllers/categories_controller.rb

class CategoriesController < ApplicationController
  def index
  end

  def show
  end
end
```

```
# app/controllers/products_controller.rb

class ProductsController < ApplicationController
  def show
  end
end
```

# Using rake task to fake data
https://github.com/ruby/rake

```
rails g task db fake_data
```

# Unit test

- Generate controller spec for `products_controller`

```
rails g rspec:controller Products create --controller-specs --no-request-specs
```

- Write unit test

```
# app/spec/controllers/products_controller_spec.rb

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "returns http success" do
      cateogry = Category.create(name: 'Laptop')
      post :create, params: { product: { name: 'Macbook Pro 2015', price: 2500, quantity: 3, category_id: category.id } }
      expect(Product.count).to eql(1)
    end
  end
end
```

- Execute unit test

```
bundle exec rspec
```
