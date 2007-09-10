require File.dirname(__FILE__) + '/../../spec_helper'

@regexp_new = shared "Regexp.new" do |cmd|
  describe "Regexp.#{cmd}" do
    it "new should create a new regular expression object" do
      Regexp.send(cmd, '').is_a?(Regexp).should == true
    end
  end
end

describe "Range.new" do
  it_behaves_like(@regexp_new, :new)
end
