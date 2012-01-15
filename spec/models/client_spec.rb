require "spec_helper"

describe TrafficControl::Client do

  it "should create a client given a hash of data" do
    client = TrafficControl::Client.new({
      "dhcpPhysAddress" => "foo",
      "dhcpIpAddress" => "bar",
      "dhcpClientID" => "\"\"",
      "dhcpLeaseTime" => "1961"
    })

    client.mac.should == "foo"
    client.ip.should == "bar"
    client.client_id.should == "\"\""
    client.lease_time.should == "1961"
  end
end