require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it "check the username , email and password " do
      user = User.new(name: "",email: "", password: "").save
      expect(user).to eq(false)
    end
  end
end


RSpec.describe User, type: :model do
  context 'validations' do
    it "check the username , email and password " do
      user = User.new(name: "abc",email: "abc@gmail.com", password: "123").save
      expect(user).to eq(false)
    end
  end
end


RSpec.describe User, type: :model do
  context 'validations' do
    it "check the username , email and password " do
      user = User.new(name: "abc",email: "abc@gmail.com", password: "123").save
      expect(user).to eq(false)
    end
  end
end

