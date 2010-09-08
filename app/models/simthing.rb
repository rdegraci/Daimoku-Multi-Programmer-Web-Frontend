require '/usr/local/daimoku-server/support.rb'

class Simthing < ActiveRecord::Base
  belongs_to :simperson
  belongs_to :simplace

  validates_presence_of :name
  validates_length_of :name, :within => 0..60
  
  validates_presence_of :description
  validates_length_of :description, :within => 0..1024
  
  validates_length_of :script, :within => 0..4096
  validates_length_of :creatorname, :within => 0..60

  validates_presence_of :strength
  validates_inclusion_of :strength, :in => 0..100
  
  validates_presence_of :weight
  validates_inclusion_of :weight, :in => 0..2000

  # validates_presence_of :portable
  # validates_presence_of :visible
  # validates_presence_of :container
  # validates_presence_of :platform
  # validates_presence_of :clothing
  
  # Provide a random id, used for uniquely identifying this thing
  def self.randid
    abc = %{ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz}
    (1..20).map { abc[rand(abc.size),1] }.join
  end

  # Make a generic thing
  def make_thing(io, name = "A Thing", description = "This is a thing.", script = "")
    thing = Simthing.new
    thing.name = name
    thing.description = description
    thing.script = script
    thing.creatorname = io.name
    thing.strength = 50
    thing.weight = 10
    thing.portable = true
    thing.visible = true
    thing.container = false
    thing.platform = false
    thing.clothing = false
    thing.uniqueid = Simthing.randid
    thing.save!
    thing
  end
  
  # Make Database SimThing
  def new_klass(klass_name, klass_source)
    klass_source.gsub!("#{klass_name}", "#{klass_name} < Simthing")
    klass = %{
    #{klass_source}
    }
    TheSource.evaluate klass
    eval("TheSystem.request #{klass_name}")
  end
    
end
