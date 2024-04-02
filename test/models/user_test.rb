require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "email should be present" do
    user = User.create(password: "password")
    assert(!user.save)
  end

  test "email format" do
    user = User.create(email: "a.com", password: "password")
    assert(!user.save)
  end

  test "email unique" do
    User.create(email: "a@gmail.com", password: "password")
    user = User.new(email: "a@gmail.com", password: "password")
    assert(!user.save)
  end

  test "password should be present" do
    user = User.create(email: "a@gmail.com")
    assert(!user.save)
  end

  test "password at least 8 characters" do
    user = User.create(email: "a@gmail.com", password: "pass")
    assert(!user.save)
  end

  test "save" do
    user = User.create(email: "a@gmail.com", password: "password")
    assert(user.save)
  end

end
