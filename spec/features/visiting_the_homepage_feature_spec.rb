require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of recent games and can view them" do
    user = User.first || User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")
    most_recent_game = Game.create(name: "Battlerockets", description: "Throwing rocks is only half the battle.", creator: user)

    visit "/"

    within(".recent-games") do
      expect(page).to have_content most_recent_game.name
      click_link("#{most_recent_game.name}")
    end

    expect(page).to have_current_path game_path(most_recent_game)
  end

  xscenario "the user can create a new game" do
    visit "/"

    click_link("Create New Game")

    expect(page).to have_current_path new_game_path
  end

end
