module TrafficControl
  class Client
    attr_accessor :mac, :ip, :client_id, :lease_time
    
    def initialize(attributes)
      @mac, @ip, @client_id, @lease_time = attributes["dhcpPhysAddress"], attributes["dhcpIpAddress"], attributes["dhcpClientID"], attributes["dhcpLeaseTime"]
    end
    
  end
end