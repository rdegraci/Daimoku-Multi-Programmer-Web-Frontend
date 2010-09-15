require '/usr/local/daimoku-rails/app/helpers/sim_variables_helper.rb'

class SimVariable < ActiveRecord::Base
  
  include SimVariablesHelper
  
  # Daimoku Multi-Programmer
  def self.sandbox= sb
    @@matrix = sb
  end
  
  # Daimoku Multi-Programmer
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
  
  # Tell Daimoku Multi-Programmer to reload this object's source
  def reload_source
    start_server
    @hub.reload("SimVariable",name)
  end
  
end
