class Simwest < ActiveRecord::Base
  belongs_to :simplace
  has_one :simdoor
end
