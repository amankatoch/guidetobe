module Authentication
  extend ActiveSupport::Concern

  included do
    has_secure_password
  end

  module ClassMethods
    def authenticate(username, password)
      user = find_by_username(username)
      user if user && user.authenticate(password)
    end
  end

end