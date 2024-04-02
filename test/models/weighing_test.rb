require "test_helper"

class WeighingTest < ActiveSupport::TestCase

  test "weight without values doesn't save" do
    w = Weighing.new
    assert(!w.save)
  end

  test "value > 0" do
    user = User.create(email: "a@gmail.com", password: "password")
    w = Weighing.new(value: -10, user: user)
    assert(!w.save)
  end

  test "user should be present" do
    w = Weighing.new(value: 60)
    assert(!w.save) 
  end

  test "save" do
    user = User.create(email: "a@gmail.com", password: "password")
    w = Weighing.new(value: 50, user: user)
    assert(w.save) 
  end

end