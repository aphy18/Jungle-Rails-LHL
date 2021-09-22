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
      expect(@user.valid?).to eq(false)
    end
    it "fails if email is not set" do
      @user = User.new
      @user.name = 'Marcus Smart'
      @user.email = nil
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user.valid?).to eq(false)
    end
    it "fails if password is not set" do
      @user = User.new
      @user.name = 'Marcus Smart'
      @user.email = "Marcus12@gmail.com"
      @user.password = nil
      expect(@user.valid?).to eq(false)
    end
    it "fails if password confirmation is not set" do
      @user = User.new
      @user.name = nil
      @user.email = "Marcus12@gmail.com"
      @user.password = "password"
      @user.password_confirmation = "tiger123"
      expect(@user.valid?).to eq(false)
    end
    it "fails if the password and password confimration is less than 5 characters" do
      subject.password = 'password'
      subject.password_confirmation = 'password'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end
    it "fails if the email is being used" do
      @user = User.new
      @user.email = "Marcus12@gmail.com"
      expect(@user.valid?).to eq(false)
    end
   
    describe '.authenticate_with_credentials' do
      
      it 'returns user if authenticated' do
        @user = User.new(name: "Marcus Smart", email: "marcus12@gmail.com", password: "password", password_confirmation: "password")
        @user.save
        auth = User.authenticate_with_credentials("MARCUS12@gmail.com", "password")
        expect(auth).to eq(@user)
      end
      it 'should not authenticate email is wrong' do
        @user = User.new(name: "Marcus Smart", email: "marcus12@gmail.com", password: "password", password_confirmation: "password")
        @user.save
        auth = User.authenticate_with_credentials('max@gmail.com', 'password')
        expect(auth).to eq(nil)
      end
      it 'should fail if password is wrong' do
        @user = User.new(name: "Marcus Smart", email: "marcus12@gmail.com", password: "password", password_confirmation: "password")
        @user.save
        auth = User.authenticate_with_credentials('marcus12@gmail.com', 'last')
        expect(auth).to eq(nil)
      end
      it 'should pass even if there are mistaken uppercases' do
        @user = User.new(name: "Marcus Smart", email: "marcus12@gmail.com", password: "password", password_confirmation: "password")
        @user.save
        auth = User.authenticate_with_credentials("mArcuS12@GMail.com", "password")
        expect(auth).to eq(@user)
      end
    end
  end
end
