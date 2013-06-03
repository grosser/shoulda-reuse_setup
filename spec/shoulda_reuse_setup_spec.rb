require "spec_helper"

describe ShouldaReuseSetup do
  it "has a VERSION" do
    ShouldaReuseSetup::VERSION.should =~ /^[\.\da-z]+$/
  end
end
