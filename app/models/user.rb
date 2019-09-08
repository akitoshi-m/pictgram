class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A\w*@\w*[.]\w*\z/ }
  validates :password, length: {minimum: 8, maximum: 32 }, 
                                    format: { with: /\A[a-zA-Z]*\d*\z/ }
  
  has_secure_password
end
