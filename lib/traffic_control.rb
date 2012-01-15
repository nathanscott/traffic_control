require "traffic_control/version"
require "traffic_control/airport"
require "traffic_control/client"

module TrafficControl
  SNMPBIN = File.dirname(__FILE__) + "../bin/snmpwalk"
  SNMPBIN = "/usr/bin/snmpwalk"
end
