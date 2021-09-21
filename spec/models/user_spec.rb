require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "proceeds if all requirements are valid" do
      @user = User.new
      @user.name = 'Marcus Smart'
      @user.email = "Marcus12@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user.valid?).to be_present
    end
    it "fails if name is not set" do
      @user = User.new
      @user.name = nil
      @user.email = "Marcus12@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user.valid?).to be_present
    end
    it "fails if there's no email" do
      @user = User.new
      @user.name = 'Marcus Smart'
      @user.email = nil
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user.valid?).to be_present
    end
    it "fails if password is not set" do
      @user = User.new
      @user.name = 'Marcus Smart'
      @user.email = "Marcus12@gmail.com"
      @user.password = nil
      expect(@user.valid?).to eq(false)
    end
    # it "fails if password is less than 10 characters" do
    #   @user = User.new
    #   @user.name = 'Marcus Smart'
    #   @user.email = "Marcus12@gmail.com"
    #   @user.password = 'cats'
    #   expect(@user.password.length).to_enum >= 10
    # end
    it "fails if password confirmation is not set" do
      @user = User.new
      @user.name = nil
      @user.email = "Marcus12@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "tiger123"
      expect(@user.valid?).to eq(false)
    end
    it "fails if the email is being used" do
      @user = User.new
      @user.email = "Marcus12@gmail.com"
      expect(@user.valid?).to eq(false)
    end
  end
end
