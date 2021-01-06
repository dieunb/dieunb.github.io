# frozen_string_literal: true

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  unless ActiveRecord::Base.connection.table_exists?('users')
    connection.create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end

  has_secure_password

  has_many :products

  validates :email, presence: true

  after_create :send_welcome_email

  private

  def send_welcome_email
    puts 'Send welcome email!!!'
  end
end
