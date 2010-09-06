class User < ActiveRecord::Base
  has_many :roles
  
  acts_as_authentic
  
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
end
