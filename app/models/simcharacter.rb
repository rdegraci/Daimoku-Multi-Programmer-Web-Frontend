require '/usr/local/Daimoku-Rails/app/models/simperson.rb'
require '/usr/local/Daimoku-Rails/app/models/simplayer.rb'

class Simcharacter < ActiveRecord::Base
  
  belongs_to :simplayer
  
  has_one :simperson, :dependent => :delete

  # validates_associated :Simperson
  # 
  # validates_length_of :name, :maximum=>30
  # validates_presence_of :name
  #  
  # validates_length_of :uniqueid, :maximum=>60
  # validates_presence_of :uniqueid
  # validates_uniqueness_of :uniqueid
  # 
  # validates_length_of :cclass, :maximum=>30
  # validates_presence_of :cclass
  # 
  # validates_length_of :race, :maximum=>30
  # validates_presence_of :race
  # 
  # validates_length_of :description, :maximum=>1024
  # validates_presence_of :description
  # 
  # validates_length_of :hungerscript, :maximum=>4096
  # validates_length_of :breathscript, :maximum=>4096
  # validates_length_of :thirstscript, :maximum=>4096
  # validates_length_of :sexscript, :maximum=>4096
  # validates_length_of :sleepscript, :maximum=>4096
  # validates_length_of :homeostasisscript, :maximum=>4096
  # validates_length_of :excretionscript, :maximum=>4096
  # validates_length_of :angerscript, :maximum=>4096
  # validates_length_of :fearscript, :maximum=>4096
  # validates_length_of :happyscript, :maximum=>4096
  # 
  # validates_presence_of :moneybag
  # validates_inclusion_of :moneybag, :in => 0..100000000
  # 
  # validates_presence_of :constitution
  # validates_inclusion_of :constitution, :in => 3..180
  # 
  # validates_presence_of :size
  # validates_inclusion_of :size, :in => 3..180
  # 
  # validates_presence_of :dexterity
  # validates_inclusion_of :dexterity, :in => 3..180
  # 
  # validates_presence_of :strength
  # validates_inclusion_of :strength, :in => 3..180
  # 
  # validates_presence_of :intelligence
  # validates_inclusion_of :intelligence, :in => 3..180
  # 
  # validates_presence_of :wisdom
  # validates_inclusion_of :wisdom, :in => 3..180
  # 
  # validates_presence_of :charisma
  # validates_inclusion_of :charisma, :in => 3..180
  # 
  # 
  # # character level      
  # validates_presence_of :level
  # validates_inclusion_of :level, :in => 1..4096
  #  
  # # needed to level
  # validates_presence_of :experience
  # validates_inclusion_of :level, :in => 1..100000000
  # 
  # #current
  # validates_presence_of :exp
  # validates_inclusion_of :exp, :in => 1..100000000
  # 
  # #max
  # validates_presence_of :armorclass
  # validates_inclusion_of :armorclass, :in => 1..100000000 
  # 
  # #current
  # validates_presence_of :ac
  # validates_inclusion_of :ac, :in => 1..100000000
  # 
  # #max
  # validates_presence_of :hitpoints
  # validates_inclusion_of :hitpoints, :in => 1..100000000 
  # 
  # #current
  # validates_presence_of :hp
  # validates_inclusion_of :hp, :in => 1..100000000
  # 
  # #max
  # validates_presence_of :speed
  # validates_inclusion_of :speed, :in => 1..100000000 
  # 
  # #current
  # validates_presence_of :sp
  # validates_inclusion_of :sp, :in => 1..100000000
  
  
  #called from within the Matrix, via CharacterProxy
  def go(direction, io)
    cleandir = "#{direction}".gsub!(/sim/,'')
    io.puts "Going #{cleandir}..."

    other = :simnorth if direction == :simsouth
    other = :simsouth if direction == :simnorth
    other = :simeast if direction == :simwest
    other = :simwest if direction == :simeast
    other = :simup if direction == :simdown
    other = :simdown if direction == :simup

    go_other = other
    go_direction = direction

    eval %{
 
    place = simperson.simplace.to_#{go_direction}
    direction = simperson.simplace.#{go_direction}

    if place == nil && direction == nil then
      io.puts "You are unable to go in that direction."
      return
    end

    if place != nil then
        simperson.simplace = simperson.simplace.to_#{go_direction}
	      save!
	      simperson.save!
        simperson.simplace.to_#{go_other}.on_exit(self, io)
        simperson.simplace.on_enter(self, io)
        return
    end

    simdoor = direction.simdoor

    if simdoor != nil then
      if simdoor.locked == true then
        io.puts "The door appers to be locked."
        return
      else
        simperson.simplace = simperson.simplace.#{go_direction}.simdoor.#{go_other}.simplace
	      save!
	      simperson.save!
        simperson.simplace.#{go_other}.simdoor.#{go_direction}.simplace.on_exit(self, io)
        simperson.simplace.on_enter(self, io)
      end
    end
    }

  end


  # Return sessionids of Characters with min/max hp
  def self.process_characters(min, max)
    chars = find(:all, :conditions => ['hp > ? and hp < ?', min, max])
    sessions = []
    chars.each do |cc|
      cc.hp = cc.hp + 25
      cc.hp = cc.hitpoints if cc.hp > cc.hitpoints
      cc.save!
      info = []
      info << cc.simplayer.sessionid
      info << cc.hp
      info << cc.hitpoints
      sessions << info
    end
    sessions
  end


  # Returns sessionid for Characters with hp < 1
  def self.reap_dead_player_sessionids
    chars = find(:all, :conditions => ['hp < ?', 1])
    sessions = []
    chars.each do |cc|
      sessions << cc.simplayer.sessionid
    end
    sessions
  end


  # Returns the sessionids of everyone in the same room, that is also online  
  def current_room_sessionids 
    result = []
    peeps = simperson.simplace.simpeople
    peeps.each do |aperson|
      result << aperson.simcharacter.simplayer.sessionid if aperson.simcharacter.simplayer.online == true
    end
    result
  end
  
  def self.randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end
  
  def logout
    simplayer.online = false;
    simplayer.sessionid = Simcharacter.randid  
    simplayer.save!
  end

  def current_room_name
    simperson.simplace.name
  end

  def current_room_description
    simperson.simplace.description
  end

  def room_occupants io
    simperson.simplace.list_room_occupants(self, io)
  end
  
  def room_items io
    simperson.simplace.list_room_items(self, io)
  end

  def announce_arrival(io)
    simperson.simplace.announce_arrival(self, io)
  end
 
  # Exits if direct place to place connection (no doors)
  def exits
    ways_out = []
    ways_out << :north if simperson.simplace.to_simnorth
    ways_out << :south if simperson.simplace.to_simsouth
    ways_out << :east if simperson.simplace.to_simeast
    ways_out << :west if simperson.simplace.to_simwest
    ways_out << :up if simperson.simplace.to_simup
    ways_out << :down if simperson.simplace.to_simdown
    ways_out
  end

  def look
    place = simperson.simplace
    [place.name, place.description]
  end
  
  def try(verb_name, text_line, name, io)
    words = text.line.split(' ')
    things = simperson.simthings
    if things.size > 0 then
      things.each do |t|
        eval("t.#{verb_name}(text_line)") if words.first == t.name
      end
      return true
    else
      io.puts
      io.puts "You don't see anything to #{verb_name}."
      io.puts
      return false
    end
  end
    
  def inventory(name, io)
    things = simperson.simthings
    io.puts "You are carrying: "
    if things.size > 0 then
      things.each do |t|
        io.print "#{t.name}"
      end
    else
      io.puts " nothing." 
    end 
    io.puts ""
  end
  
  
  def drop(item, io)
    things = simperson.simthings
    if things.size > 0 then
      things.each do |t|
        if t.name == item then
          simperson.simplace.simthings << t
          t.simperson_id = nil
          t.save!
          simperson.simplace.save!
          io.puts "You drop the #{item}"
          return true
        end
      end
    else
      return false
    end
  end
  
  def examine(item, io)
    things = simperson.simthings
    if things.size > 0 then
      things.each do |t|
        if t.name == item then
          io.puts
          io.puts "#{item.description}"
          io.puts
          return true
        end
      end
    else
      room_id = simperson.simplace_id
      thing = Simthing.find(:first, :conditions => ['name = ? & simplace_id = ?', item, room_id])
      if thing then
        io.puts
        io.puts "#{item.description}"
        io.puts
        return true
      end
    end
    io.puts
    io.puts "You don't see any #{item} to examine."
    io.puts
    return false
  end

  #create a software writer and place them into the white room
  def self.make_generic(name = "Agent Smith")

    c = Simcharacter.new
    c.name = name

    # The unique id is generated from the name and session id (passed in)
    # and is used to uniquely identify this character
    unique_identifier = "#{name}_#{randid}"
    c.uniqueid = unique_identifier

    c.cclass = "Human"
    c.race = "Nordic"
    c.description = "Software Program Writer"
    c.moneybag = 100
    c.anger = 33.33
    c.fear = 33.33
    c.happiness = 33.33
    c.hunger = 0
    c.breathing = 0
    c.thirst = 0
    c.sex = 0
    c.sleep = 0
    c.homeostatis = 0
    c.excretion = 0

    c.personalsafety = 100
    c.financialsafety = 100
    c.healthsafety = 100
    c.accidentalsafety = 100

    c.hungerscript = ""
    c.breathscript = ""
    c.thirstscript = ""
    c.sexscript = ""
    c.sleepscript = ""
    c.homeostasisscript = ""
    c.excretionscript = ""
    c.angerscript = ""
    c.fearscript = ""
    c.happyscript = ""
    
    c.constitution = 10
    c.size = 10
    c.dexterity = 10
    c.strength = 10
    c.intelligence = 10
    c.wisdom = 10
    c.charisma = 10

    c.level = 1
    
    c.experience = 100 # to level
    c.exp = 10
    
    c.armorclass = 100 #max
    c.ac = 1
    
    c.hitpoints = 100 #max
    c.hp = 10
    
    c.speed = 50 #max 50 feet per second
    c.sp = 5  #5 feet per second
    
    
    p = c.create_simperson 
    p.uniqueid = randid
    p.script = ""
    
    c.save!

    # A random variable name is generated so that this Character has an identity
    random_id = "T#{randid}"

    p.save!
    
    begin
      whiteroom = Simplace.find(1)	#default start room 
    rescue ActiveRecord::RecordNotFound
      p.create_simplace
      p.simplace.name = "White Room"
      p.simplace.description = "The White Room has no time or space."
      p.simplace.creatorname = "Architect"
      p.simplace.script = ""
      p.simplace.save!
    end 

    if whiteroom then
      p.simplace = whiteroom
    end

    c.save!
    p.save!

    c
  end
  
  
end
