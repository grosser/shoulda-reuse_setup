require "test/unit"
$LOAD_PATH.unshift File.expand_path("../../../lib", __FILE__)
require "shoulda/reuse_setup"

class ShouldaReuseTest < Test::Unit::TestCase
  context "xx" do
    reuse_setup { puts 1 }

    context "yy" do
      reuse_setup { puts 2 }

      should("xxx") { }
    end
  end
end
