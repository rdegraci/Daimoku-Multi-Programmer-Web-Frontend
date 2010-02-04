class Simeast < ActiveRecord::Base
  belongs_to :simplace
  has_one :simdoor
end
