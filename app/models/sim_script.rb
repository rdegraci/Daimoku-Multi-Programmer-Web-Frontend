require '/usr/local/daimoku-rails/app/helpers/sim_scripts_helper.rb'

class SimScript < ActiveRecord::Base
  
  include SimScriptsHelper
  
  belongs_to :user
  
  # Daimoku Multi-Programmer
  def self.sandbox= sb
    @@matrix = sb
  end
  
  # Daimoku Multi-Programmer
  def self.load_script name
    script = find(:first, :conditions => ['name = ?', name])
    if !script
      puts "Did not locate script=#{name}!"
      return
    end

    source = %{
      #{script.source}
    }
    puts "Found script=#{name}"
    puts "Source = #{source}"
    @@matrix.eval("#{source}")
  end
  
  # Tell Daimoku Multi-Programmer to reload this object's source
  def reload_source
    begin
      start_server
      @hub.reload("SimScript",name)
    rescue
      @hub = nil
    end
  end
  
end
