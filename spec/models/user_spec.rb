require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validates" do

    it "is valid with valid attributes" do
      user = User.new(email: "b@example.com")
      expect(user.valid?).to eq true
    end

    # it "requires email to have an @" do
    #   user = User.new = (email: 'batexamole.com')
    #   expect(user.valid?).to eq false
    # end

  end
end
