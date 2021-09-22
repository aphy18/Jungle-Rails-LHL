class User < ActiveRecord::Base
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_uniqueness_of :email, { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 5}
    validates :password_confirmation, presence: true, length: {minimum: 5}
    
    def self.authenticate_with_credentials(email, password)
      user = User.find_by_email(email.downcase)
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
end
