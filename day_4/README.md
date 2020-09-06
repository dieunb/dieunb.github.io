# Design database

![design database](https://cacoo.com/diagrams/0lpzpe7Wgiif3xTI-0B167.png)

# Migration and models

## Comment

```
rails g model Comment content:string review_id:integer product_id:integer user_id:integer
```

```
# app/models/comment.rb

class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :product
  belongs_to :user
end
```

## Review
```
# app/models/review.rb

class Review < ApplicationRecord
  ...
  has_many :comments
  ...
end
```

## User
```
# app/models/user.rb

class User < ApplicationRecord
  ...
  has_many :comments
  ...
end
```

# Implement controllers/views

```
# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find params[:review_id]
    @comment = @review.comments.new(comment_params)
    @comment.product = @review.product
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js
        format.json { render json: @comment, status: :created, location: @user }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:review).permit(:content)
  end
end
```

```
# config/routes.rb

Rails.application.routes.draw do
  ...
  resources :reviews, only: [] do
    resources :comments, only: %w(create)
  end
  ...
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
