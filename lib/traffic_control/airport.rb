# Inspired by Andre LaBranche's work at http://dreness.com/bits/tech/airport
# Send him love at dre at mac dot com

module TrafficControl
  class Airport
    attr_accessor :host, :settings, :clients

    def initialize(host, community = "public")
      @host = host
      @community = community
      @settings = {}
      @clients = []
    end
    
    def load_data!
      client_data = {}
      
      snmp_results = snmp_parser(snmp_output(@host, @community))
      snmp_results.each do |setting|
        if setting[1] == "0"
          self.settings[setting[0]] = setting[2]
        else
          client_data[setting[1]] ||= []
          client_data[setting.delete(setting[1])] << setting
        end      
      end

      client_data.each { |key, value| self.clients << TrafficControl::Client.new(Hash[value])  }
    end

    def snmp_output(host, community)
      snmpcmd = "#{SNMPBIN} -m AIRPORT-BASESTATION-3-MIB -Osq -v 2c "
      snmpcmd += "-c \"#{community}\" \"#{host}\" "
      snmpcmd += "SNMPv2-SMI::enterprises.apple.airport"
      
      `#{snmpcmd}`
    end
    
    def snmp_parser(output)
      output.
        chomp
        .split("\n")
        .collect{ |v| v.split(/\.(.+)/).collect{ |t| t.split(" ") }.flatten }
    end
    
  end
end