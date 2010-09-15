require 'drb'
require '/usr/local/daimoku-server/hub.rb'

module SimKlassesHelper
  
  def start_server
    @hub = DRbObject.new(nil, "druby://127.0.0.1:5010")
  end
  
end
