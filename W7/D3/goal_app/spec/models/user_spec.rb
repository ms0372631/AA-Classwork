require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) } # this replaces lines 5-8
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:tweets) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }  

  describe "uniqueness" do
    before :each do 
      create(:user)
    end
  end

  describe "is_valid_password?" do
    let!(:user) { create(:user) }

    context "with a valid password" do
      it "should return true" do
        expect(user.is_valid_password?('password')).to be true
      end
    end

    context "with an invalid password" do
      it "should return false" do
        expect(user.is_valid_password?('pineaaple')).to be false
      end
    end
  end

  describe "password encryption" do
    it "does not save passwords to the database" do
      FactoryBot.create(:user, username: 'Harry Potter')
    
      user = User.find_by(username: "Harry Potter")
      expect(user.password).not_to eq('password')
    end

    it "encrypts password using BCrypt" do
      expeact(BCrypt::Password).to recieve(:create).with('abcdef')
      FactoryBot.build(:user, password: 'abcdef')
    end
  end
end


  
