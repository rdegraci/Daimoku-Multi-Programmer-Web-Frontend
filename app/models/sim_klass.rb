class SimKlass < ActiveRecord::Base
  
  def self.sandbox= sb
    @@matrix = sb
  end
  
  
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
  
end
