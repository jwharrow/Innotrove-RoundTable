require 'rails_helper'

describe Game do
  let(:game) { Game.new }

  describe ".recent" do
    context "returns an ActiveRecord association with game objects inside" do
      6.times {Game.create(name: "Battlerocks", description: "Throwing rocks is only half the battle.", creator_id: 1)}
      it "has game objects" do
        expect(Game.recent.first).to be_an_instance_of(Game)
      end
      it "only has 5 objects" do
        expect(Game.recent.length).to eq(5)
      end
    end
  end

end
