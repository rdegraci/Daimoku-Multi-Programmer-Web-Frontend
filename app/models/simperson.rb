require '../Daimoku-Rails/app/models/simcharacter.rb'

class Simperson < ActiveRecord::Base
  belongs_to :simplace
  has_many :simthings
  belongs_to :simcharacter
  
  #Do not validate, yet. Consider giving a Person a set of things before saving the person, initially.
  #validates_associated :things
  
  validates_length_of :uniqueid, :maximum=>60
  validates_length_of :script, :maximum=>4096
  validates_presence_of :uniqueid
  
  def randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end

  
  def self.builder= proxy
    @@builder = proxy
  end

  def script_update url
    script = `curl #{url}`
    @@builder.script_update script
  end


  def tell message 
    self.reload
    self.simcharacter.reload
    character_name = self.simcharacter.name
    puts "Telling message to IO#{character_name}"
    character_io = "IO#{character_name}"
    eval %{
      begin
        #{character_io}.puts('#{message}')
      rescue NameError
	      puts "#{character_io} not available."
      end
    }
  end
  
end