class User < ActiveRecord::Base
  has_many :roles
  
  has_many :sim_scripts
  has_many :sim_variables
  has_many :sim_klasses
  has_many :sim_modules
  
  acts_as_authentic
  
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
end
