Test speedup by reusing the setup of a test context

Install
=======

    gem install shoulda-reuse_setup

    # Gemfile
    gem "shoulda-reuse_setup", :require => "shoulda/reuse_setup"

Usage
=====
<!-- example -->
```Ruby
context "reuse" do
  context "a" do
    reuse_setup do
      $foo ||= 0
      $foo += 1
      @foo = $foo
    end

    should "1 preserve instance state" do
      assert_equal 1, @foo
    end

    should "2 only run setup once" do
      assert_equal 1, $foo
    end

    should "3 preserve instance state" do
      assert_equal 1, @foo
    end

    # nesting does not work!
    # context "nested" do
    #  reuse_setup { ...  }
    # end
  end
end
```
<!-- example -->

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/shoulda-reuse_setup.png)](https://travis-ci.org/grosser/shoulda-reuse_setup)
