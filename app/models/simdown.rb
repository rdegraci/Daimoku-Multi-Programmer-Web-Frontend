class Simdown < ActiveRecord::Base
  belongs_to :simplace
  has_one :simdoor
end
