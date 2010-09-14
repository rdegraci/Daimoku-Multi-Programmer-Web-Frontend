class SimScript < ActiveRecord::Base
  
  # Daimoku Multi-Programmer
  def self.sandbox= sb
    @@matrix = sb
  end
  
  # Daimoku Multi-Programmer
  def self.load_script name
    script = find(:first, :conditions => ['name = ?', name])
    return if !script
    
    source = %{
      #{script.source}
    }
    @@matrix.eval("#{source}")
  end
  
  # Tell Daimoku Multi-Programmer to reload this object's source
  def reload_source
    start_server
    @hub.reload(to_s,name)
  end
  
end
