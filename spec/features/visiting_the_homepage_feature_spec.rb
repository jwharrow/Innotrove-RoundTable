require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of recent games and can view them" do
    most_recent_game = Game.create(name: "Battlerocks", description: "Throwing rocks is only half the battle.", creator_id: 1)

    visit "/"

    within(".recent-games") do
      expect(page).to have_content most_recent_game.name
      # click_link("#{most_recent_game.name}")
    end
  # TODO: add once we have links to show on home
    # expect(page).to have_current_path game_path(most_recent_game)
  end

  xscenario "the user can create a new game" do
    visit "/"

    click_link("Create New Game Idea")

    expect(page).to have_current_path new_game_path
  end

end
