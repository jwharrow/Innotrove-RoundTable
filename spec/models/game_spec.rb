require 'rails_helper'

describe Game do
  let(:game) { Game.new }
  # let(:user) { User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")}

  describe ".recent" do
    context "returns an ActiveRecord association with game objects inside" do
      user = User.first || User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")
      6.times {Game.create!(name: "Battlerocks", description: "Throwing rocks is only half the battle.", creator_id: user.id)}
      it "has game objects" do
        expect(Game.recent.first).to be_an_instance_of(Game)
      end
      it "only has 5 objects" do
        expect(Game.recent.length).to eq(5)
      end
    end
  end

end
