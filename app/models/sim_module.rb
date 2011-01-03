require '/usr/local/daimoku-rails/app/helpers/sim_modules_helper.rb'

class SimModule < ActiveRecord::Base
  
  include SimModulesHelper
  
  belongs_to :user
  validates_uniqueness_of :name, :scope => :user_id
  
  # Daimoku Multi-Programmer
  def self.sandbox= sb
    @@matrix = sb
  end
  
  # Daimoku Multi-Programmer
  def self.load_module name
    mmodule = find(:first, :conditions => ['name = ?', name])
    return if !mmodule
    
    importscript = %{
      #{mmodule.importscript}
    }
    source = %{
      #{mmodule.source}
    }
    @@matrix.eval("#{source}") if @@matrix.eval("#{importscript}")
  end
    
  # Tell Daimoku Multi-Programmer to reload this object's source
  def reload_source
    begin
      start_server
      @hub.reload("SimModule",name)
    rescue
      @hub = nil
    end
  end
  
end
