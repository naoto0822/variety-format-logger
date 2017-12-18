#!/usr/bin/ruby

class Parent
  def initialize(hoge, foo)
    p hoge
    p foo
  end
end

class Test < Parent
  def initialize(*)
    super
    self.color = "Red"
  end

  def color=(value)
    p value
    @color = value
  end
end

test = Test.new("hoge","foo")
test.color = "Blue"
