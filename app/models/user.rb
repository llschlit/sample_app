class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password # see note below
  validates :password, length: { minimum: 6 }
  
end

# has_secure_password:
# -------------------
# this one method adds the following functionality:
#
#     The ability to save a securely hashed password_digest attribute to
#       the database
#     A pair of virtual attributes18 (password and
#        password_confirmation), including presence validations upon
#        object creation and a validation requiring that they match
#     An authenticate method that returns the user when the
#        password is correct (and false otherwise) 
#
# The only requirement for has_secure_password to work its
# magic is for the corresponding model to have an attribute
# called password_digest.
