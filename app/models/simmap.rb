class Simmap < ActiveRecord::Base
  has_many :simplaces, :dependent => :nullify
end
