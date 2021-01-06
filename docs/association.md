# Add user_id column to posts table

```
ALTER TABLE table_name
ADD COLUMN column_name data_type constrait;
```


Example:

```
ALTER TABLE products ADD COLUMN user_id BIGINT;
```

In the not null constrait case

```
ALTER TABLE products ADD COLUMN user_id BIGINT NOT NULL;
```

In the foreign key case need run this cmmand more

```
ALTER TABLE products ADD FOREIGN KEY (user_id) REFERENCES users(id);
```

How to drop a existed column

```
ALTER TABLE table_name
DROP COLUMN IF EXISTS column_name;
```

If the column that you want to remove is used in other database objects such as views, triggers, stored procedures, etc., you cannot drop the column because other objects depend on it. In this case, you add the CASCADE option to the DROP COLUMN clause to drop the column and all of its associated objects:

```
ALTER TABLE table_name
DROP COLUMN column_name CASCADE;
```

Example:

```
ALTER TABLE products
DROP COLUMN IF EXISTS user_id;
```

# Definition association between models

How many association type between 2 tables?

1. 1 - 1
2. 1 - n
3. n - m

What the difference between 1 - 1 and 1 - n?


User (1) -|------|> (n) Products

```
class User < ActiveRecord::Base
  has_many :products
end
```

```
class Product < ActiveRecord::Base
  belongs_to :user
end
```

# Add controller / views / handle submit form

```
class ProductsController < BaseController
  def index # GET
    @products = Product.all
  end

  def new # GET
    @product = Product.new
  end

  def create # POST
    @product = Product.new product_params

    if @product.save
      redirect('/products')
    else
      render('users/new')
    end
  end

  private

  def product_params
    request.params['product']
  end
end
```
