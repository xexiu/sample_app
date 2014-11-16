# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar" }
  end

  it "should create a new instance given valid attributes" do
      User.create!(@attr)
  end

  describe "password validations" do
    it "should require a password" do
      user_pass = User.new(@attr.merge(:password => "", :password_confirmation => ""))
      expect(user_pass).to_not be_valid
    end

    it "should require a matching password confirmation" do
      user_pass_confirm = User.new(@attr.merge(:password_confirmation => "invalid"))
      expect(user_pass_confirm).to_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      user_hash_short = User.new(hash)
      expect(user_hash_short).to_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      user_hash_long = User.new(hash)
      expect(user_hash_long).to_not be_valid
    end

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      expect(@user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      expect(@user.encrypted_password).to_not be_blank
    end
  end

  # describe "name and email validations" do
  #   it "should require a name" do
  #     no_name_user = User.new(@attr.merge(:name => ""))
  #     expect(no_name_user).to_not be_valid
  #   end

  #   it "should require an email address" do
  #     no_email_user = User.new(@attr.merge(:email => ""))
  #     expect(no_email_user).to_not be_valid
  #   end

  #   it "should reject names that are too long" do
  #     long_name = "a" * 51
  #     long_name_user = User.new(@attr.merge(:name => long_name))
  #     expect(long_name_user).to_not be_valid
  #   end

  #   it "should accept valid email addresses" do
  #     addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  #     addresses.each do
  #       |address|
  #       valid_email_user = User.new(@attr.merge(:email => address))
  #       expect(valid_email_user).to be_valid
  #     end
  #   end

  #   it "should reject invalid email addresses" do
  #     addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
  #     addresses.each do
  #       |address|
  #       invalid_email_user = User.new(@attr.merge(:email => address))
  #       expect(invalid_email_user).to_not be_valid
  #     end
  #   end

  #   it "should reject duplicate email addresses" do
  #     # Put a user with given email address into the database.
  #     User.create!(@attr)
  #     user_with_duplicate_email = User.new(@attr)
  #     expect(user_with_duplicate_email).to_not be_valid
  #   end

  #   it "should reject email addresses identical up to case" do
  #     upcased_email = @attr[:email].upcase
  #     User.create!(@attr.merge(:email => upcased_email))
  #     user_with_duplicate_email = User.new(@attr)
  #     expect(user_with_duplicate_email).to_not be_valid
  #   end
  # end

end
