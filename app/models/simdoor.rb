class Simdoor < ActiveRecord::Base
  has_one :simkey, :dependent => :delete
 
  belongs_to :simnorth
  belongs_to :simsouth
  belongs_to :simeast
  belongs_to :simwest
  belongs_to :simup
  belongs_to :simdown
  
  def randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end

  def east_of place
     place.create_simwest
     place.simwest.simdoor = self
     place.save!
  end

  def west_of place
    place.create_simeast
    place.simeast.simdoor = self
    place.save!
  end

  def north_of place
    place.create_simsouth
    place.simsouth.simdoor = self
    place.save!
  end

  def south_of place
    place.create_simnorth
    place.simnorth.simdoor = self
    place.save!
  end

  def up_of place
    place.create_simdown
    place.simdown.simdoor = self
    place.save!
  end

  def down_of place
    place.create_simup
    place.simup.simdoor = self
    place.save!
  end
  
end
