require "test/unit"
$LOAD_PATH.unshift File.expand_path("../../../lib", __FILE__)
require "shoulda/reuse_setup"

class ShouldaReuseTest < Test::Unit::TestCase
  context "Readme" do
    example = File.read(File.expand_path("../../../Readme.md", __FILE__)).match(/<!-- example -->\n```Ruby(.*)```\n<!-- example -->/m)[1]
    eval example
  end

  context "details" do
    reuse_setup do
      @foo = 1
    end

    should("aa nothing") { assert_equal 1, @foo }

    should "not change method names" do
      assert_equal "test: details should not change method names. ", @method_name
    end

    should("zz nothing") { assert_equal 1, @foo }
  end

  should "not be able to reuse setup" do
    result = `ruby test/reuse_setup_bad_example.rb`
    refute $?.success?
    assert_includes result, "cannot nest reuse_setup"
  end

  context "details 2" do
    reuse_setup do
      @foo = 2
    end

    should "not overlap with others" do
      assert_equal 2, @foo
    end
  end
end
