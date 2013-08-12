require 'spec_helper'

describe User do
  it "can be instanciated" do
    User.new.should be_an_instance_of(User)
  end

  it "is invalid without a name" do
    user = User.new({:email => "yoda@dagobah.com", :password => "theforce"})
    user.save.should eq(false)
  end

  it "is invalid without a email" do
    user = User.new({:name => "Yoda", :password => "theforce"})
    user.save.should eq(false)
  end

  it "is invalid without a password during creation only" do
    user = User.create({:name => "Yoda", :email => "yoda@dagobah.com"})
    user.persisted?.should eq(false)
  end

  it "is invalid without password longer than 4 characters" do
    user = User.new({:name => "Yoda", :password => "thef"})
    user.save.should eq(false)
  end

  it "authenticates correctly with the right password" do
    user = User.new({:name => "Yoda", :email => "yoda@dagobah.com", :password => "theforce"})
    user.save
    auth_result = User.authenticate("yoda@dagobah.com", "theforce")
    auth_result.should eq(user)
    user.destroy
  end

  it "fails to authenticate with wrong password" do
    user = User.new({:name => "Yoda", :email => "yoda@dagobah.com", :password => "theforce"})
    user.save
    auth_result = User.authenticate("yoda@dagobah.com", "thef")
    auth_result.should eq(nil)
    user.destroy
  end
end
