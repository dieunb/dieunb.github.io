# Callback
https://railsup.files.wordpress.com/2013/11/db_lifecycle.png

## Creating an Object
- before_validation
- after_validation
- before_save
- around_save
- before_create
- around_create
- after_create
- after_save
- after_commit/after_rollback

## Updating an Object
- before_validation
- after_validation
- before_save
- around_save
- before_update
- around_update
- after_update
- after_save
- after_commit/after_rollback

## Destroying an Object
- before_destroy
- around_destroy
- after_destroy
- after_commit/after_rollback

# Practice

## Normalize user email before saving user to database

```
class User < ActiveRecord::Base
  before_save do |user|
    user.email = user.email.downcase
  end
end
```

or

```
class User < ActiveRecord::Base
  before_create :normalize_email

  private

  def normalize_email
    self.email = self.email.downcase
    # or self.email.downcase!
  end
end
```

## Sending welcome email to user after user sign up completely
Send email by using block code

```
class User < ActiveRecord::Base
  after_commit do |user|
    UserMailer.send_welcome_email(user)
  end
end
```

Send email by using private method
```
class User < ActiveRecord::Base
  after_commit :send_welcome_email

  private

  def send_welcome_email
    UserMailer.send_welcome_email(self)
  end
end
```

## Delete all products belongs to a user when the system delete that user


Practice by sending an email when the user updates their attributes, examle they update their password

Make a feature to allow user can request forgot password:
- User click on forgot password link
- User enter their email and click to get an email
- User check email and click on the forget password link in email content
- User enter new password and password confirmation and then click submit
- The system check that request and send email to notify user if that request is valid


