class SimModule < ActiveRecord::Base
  
  def self.sandbox= sb
    @@matrix = sb
  end
  
  
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
  
end
