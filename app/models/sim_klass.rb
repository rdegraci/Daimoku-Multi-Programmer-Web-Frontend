require '/usr/local/daimoku-rails/app/helpers/sim_klasses_helper.rb'

class SimKlass < ActiveRecord::Base
  
  include SimKlassesHelper
  
  belongs_to :user
  
  # Daimoku Multi-Programmer
  def self.sandbox= sb
    @@matrix = sb
  end
  
  # Daimoku Multi-Programmer
  def self.load_klass name
    klass = find(:first, :conditions => ['name = ?', name])
    return if !klass
    
    importscript = %{
      #{klass.importscript}
    }
    source = %{
      #{klass.source}
    }
    @@matrix.eval("#{source}") if @@matrix.eval("#{importscript}")
  end
  
  # Tell Daimoku Multi-Programmer to reload this object's source
  def reload_source
    begin
      start_server
      @hub.reload("SimKlass",name)
    rescue
      @hub = nil
    end
  end
  
end
