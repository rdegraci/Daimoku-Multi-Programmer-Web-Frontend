require '../daimoku-rails/app/models/simplayer.rb'
class Simplayer < ActiveRecord::Base
  has_many :simcharacters
  validates_associated :simcharacters
  
  validates_length_of :name, :maximum=>30
  validates_uniqueness_of :name
  
  validates_length_of :password, :maximum=>30
  validates_presence_of :password
  
  validates_length_of :email, :maximum=>40
  validates_presence_of :password

  validates_uniqueness_of :sessionid
  validates_presence_of :sessionid
  
  def self.locate(name, password)
    player = Simplayer.find(:first, :conditions => ['name = ? and password = ?', name, password])
  end

  def self.randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end

  # Called by matrix-server to create a new player
  # via matrix.eval
  #
  def self.make_name(name, password)
    p1 = Simplayer.new
    p1.name = name
    p1.password = password
    p1.email = "player@local"
    p1.sessionid = randid
    
    c1 = Simcharacter.make_generic(name)
    c1.name = name
    p1.simcharacters << c1
    c1.save!
    p1.save!
  end

  def self.reset_online_status
    players = Simplayer.find_all_by_online true
    return unless players
    players.each do |aplayer|
      aplayer.online = false
      aplayer.save!
    end
  end
  
end
