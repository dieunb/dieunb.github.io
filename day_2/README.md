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

```
rails g task db fake_data
```

# Write unit test
