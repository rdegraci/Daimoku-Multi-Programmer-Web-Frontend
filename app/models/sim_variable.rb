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
  
  def self.reload_variable
    variable_importscript = %{
      #{importscript}
    }
    variable_value = %{
      #{value}
    }
    @@matrix.eval("#{name}=#{variable_value}") if @@matrix.eval("#{variable_importscript}")
  end
  
end
