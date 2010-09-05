class SimScript < ActiveRecord::Base
  
  def self.sandbox= sb
    @@matrix = sb
  end
  
  
  def self.load_script name
    script = find(:first, :conditions => ['name = ?', name])
    return if !script
    
    source = %{
      #{script.source}
    }
    @@matrix.eval("#{source}")
  end

  
end
