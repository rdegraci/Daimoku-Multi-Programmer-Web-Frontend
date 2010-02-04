class Simplace < ActiveRecord::Base
  has_many :simpeople 
  belongs_to :simmap
  has_many :simthings

  has_one :simnorth
  has_one :simsouth
  has_one :simeast
  has_one :simwest
  has_one :simup
  has_one :simdown
  
  validates_length_of :name, :maximum=>30
  validates_presence_of :name
  validates_length_of :description, :maximum=>1024
  validates_presence_of :description
  validates_length_of :script, :maximum=>4096
  validates_length_of :creatorname, :maximum=>30
  
  def randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end

  def north_of door
    raise if door.simnorth == nil
    create_simsouth
    simsouth.simdoor = door
    save!
  end

  def south_of door
    raise if door.simsouth == nil
    create_simnorth
    simnorth.simdoor = door
    save!
  end

  def east_of door
    raise if door.simeast == nil
    create_simwest
    simwest.simdoor = door
    save!
  end

  def west_of door
    raise if door.simwest == nil
    create_simeast
    simeast.simdoor = door
    save!
  end

  def up_of door
    raise if door.simup == nil
    create_simdown
    simdown.simdoor = door
    save!
  end

  def down_of door
    raise if door.simdown == nil
    create_simup
    simup.simdoor = door
    save!
  end
  
  
  belongs_to :to_simnorth,
 	  :class_name => "Simplace",
 	  :foreign_key => "southsimplace_id"

   belongs_to :to_simsouth,
         :class_name => "Simplace",
         :foreign_key => "northsimplace_id"

   belongs_to :to_simeast,
         :class_name => "Simplace",
         :foreign_key => "westsimplace_id"

   belongs_to :to_simwest,
         :class_name => "Simplace",
         :foreign_key => "eastsimplace_id"

   belongs_to :to_simdown,
         :class_name => "Simplace",
         :foreign_key => "upsimplace_id"

   belongs_to :to_simup,
         :class_name => "Simplace",
         :foreign_key => "downsimplace_id"


   has_one :south_to,
   	  :class_name => "Simplace",
 	    :foreign_key => "southsimplace_id"

   has_one :north_to,
         :class_name => "Simplace",
         :foreign_key => "northsimplace_id"

   has_one :east_to,
         :class_name => "Simplace",
         :foreign_key => "eastsimplace_id"

   has_one :west_to,
         :class_name => "Simplace",
         :foreign_key => "westsimplace_id"

   has_one :down_to,
         :class_name => "Simplace",
         :foreign_key => "downsimplace_id"

   has_one :up_to,
         :class_name => "Simplace",
         :foreign_key => "upsimplace_id"



   def on_exit(acharacter, io)
     notify_occupants("#{acharacter.name} has gone to the #{acharacter.current_room_name}.", io)
   end


   def on_enter(acharacter, io)
     announce_arrival(acharacter, io)
     describe_room io
     list_room_occupants(acharacter, io)
   end

   def announce_arrival(acharacter, io)
     notify_occupants("#{acharacter.name} has entered the #{name}.", io)
   end

   def notify_occupants(text, io)    
     people = Simperson.find(:all, :conditions => ['simplace_id = ?', self.id], :include => [{:simcharacter => :simplayer}])
     
     sessions = []
     people.each do |aperson|
       sessions << aperson.simcharacter.simplayer.sessionid
     end

     #tell everyone we have entered
     io.tell(text, sessions)
   end

   def describe_room io
     io.puts
     io.puts "#{name}"
     io.puts
     io.puts "#{description}"
     io.puts
   end

   def list_room_occupants(acharacter, io)

     myname = acharacter.name
     people = Simperson.find(:all, :conditions => ['simplace_id = ?', self.id], :include => [{:simcharacter => :simplayer}])
     
     online_peeps = []
     people.each do |aperson|
       stranger = aperson.simcharacter.name
       aperson.simcharacter.simplayer
       online = aperson.simcharacter.simplayer.online == true
       if (stranger != myname && online == true ) then
         online_peeps << stranger
       end
     end
     if online_peeps.size > 0 
       io.print "You see:"
       online_peeps.each do |apeep|
         io.print " #{apeep} "
       end
       io.puts
     else
       io.puts "You are alone."
     end
   end
   
   
   def list_room_items(acharacter, io)
     things = Simthing.find(:all, :conditions => ['simplace_id = ?', self.id] )
     io.puts ""
     if things.size > 0 then
       io.print "You see:"
       things.each do |thing|
         io.print "  #{thing.name}  "
       end
       io.puts ""
     end
   end

   def DEBUG_list_room_occupants(acharacter, io)
     acharacter.reload
     self.reload
     peeps = self.simpeople true  #array of people in the current room
     myname = acharacter.name
     if peeps.size > 1 then
       io.puts
       io.puts
       io.print "You see"
       peeps.each do |aperson|
         aperson.simcharacter.reload
         stranger = aperson.simcharacter.name
         aperson.simcharacter.simplayer.reload
         online = aperson.simcharacter.simplayer.online == true
         if (stranger != myname && online == true ) then
           io.print ", #{stranger}"
         end
       end
       io.puts
     else
       io.puts "You are alone."
     end
   end



   #API Start

   def make_door_north
     make_door_to_place :north
   end

   def make_door_to_place direction

     other = :north if direction == :south
     other = :south if direction == :north
     other = :east if direction == :west
     other = :west if direction == :east
     other = :up if direction == :down
     other = :down if direction == :up

     eval %{
       reload
       create_sim#{direction}
       sim#{direction}.create_simdoor
       save!

       place = Simplace.new
       place.name = '#{direction} place'
       place.description = '#{direction} place'
       place.create_sim#{other}
       place.sim#{other}.simdoor = sim#{direction}.simdoor
       place.save!
     }
   end

   def build_south_place(name = "south place", description = "south description", creator = "Architect", script = "")
     reload
     southplace = create_south_to
     southplace.north_to = self
     southplace.name = name
     southplace.description = description
     southplace.creatorname = creator
     southplace.script = script
     southplace.save!
     southplace
   end

   def build_north_place(name = "north place", description = "north description", creator = "Architect", script = "")
     reload
     northplace = create_north_to
     northplace.south_to = self
     northplace.name = name
     northplace.description = description
     northplace.creatorname = creator
     northplace.script = script
     northplace.save!
     northplace
   end

   def build_west_place(name = "west place", description = "west description", creator = "Architect", script = "")
     reload
     westplace = create_west_to
     westplace.east_to = self
     westplace.name = name
     westplace.description = description
     westplace.creatorname = creator
     westplace.script = script
     westplace.save!
     westplace
   end

   def build_east_place(name = "east place", description = "east description", creator = "Architect", script = "")
     reload
     eastplace = create_east_to
     eastplace.west_to = self
     eastplace.name = name
     eastplace.description = description
     eastplace.creatorname = creator
     eastplace.script = script
     eastplace.save!
     eastplace
   end


   def build_up_place(name = "up place", description = "up description", creator = "Architect", script = "")
     reload
     upplace = create_up_to
     upplace.down_to = self
     upplace.name = name
     upplace.description = description
     upplace.creatorname = creator
     upplace.script = script
     upplace.save!
     upplace
   end

   def build_down_place(name = "down place", description = "down description", creator = "Architect", script = "")
     reload
     downplace = create_down_to
     downplace.up_to = self
     downplace.name = name
     downplace.description = description
     downplace.creatorname = creator
     downplace.script = script
     downplace.save!
     downplace
   end
  
  
end
