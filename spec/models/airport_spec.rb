require "spec_helper"

describe TrafficControl::Airport do
  subject { TrafficControl::Airport.new "airport.local" }
  
  it "should grab teh snmpwalk results and parse them" do
    subject.stub! :snmp_parser => [["foo", "name", "bar"]], :snmp_output => nil
    subject.load_data!
    
    subject.clients.should == { "name" => { "foo" => "bar" } }
  end
  
  it "should parse the results of an snmpwalk output" do
    mock_output = "foo.0 bar
      foo.0 
      foo.\"bar\" \"bar\""
        
    subject.snmp_parser(mock_output).should == [
      ["foo", "0", "bar"],
      ["foo", "0"],
      ["foo", "\"bar\"", "\"bar\""],
    ]
  end

end