require "test_helper"

class WeighingTest < ActiveSupport::TestCase

  test "weight without values doesn't save" do
    w = Weighing.new
    result = w.save
    assert(result == false)
  end

  test "value > 0" do
    user = User.create(email: "a@gmail.com", password: "password")
    w = Weighing.new(value: -10, user: user)
    result = w.save
    assert(result == false)
  end

  test "user should be present" do
    w = Weighing.new(value: 60)
    result = w.save
    assert(result == false) 
  end

  test "save" do
    user = User.create(email: "a@gmail.com", password: "password")
    w = Weighing.new(value: 50, user: user)
    result = w.save
    assert result
  end

end


