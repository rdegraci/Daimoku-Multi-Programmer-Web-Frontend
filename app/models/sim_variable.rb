class SimVariable < ActiveRecord::Base
  
  def self.sandbox= sb
    @@matrix = sb
  end
  
  
  def self.load_variable name
    
    variable = find(:first, :conditions => ['name = ?', name])
    return if !variable
    
    importscript = %{
      #{variable.importscript}
    }
    value = %{
      #{variable.value}
    }
    @@matrix.eval("#{name}=#{value}") if @@matrix.eval("#{importscript}")
  end
  
end
