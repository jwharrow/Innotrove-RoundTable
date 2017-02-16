Game.delete_all
User.delete_all

user = User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")

5.times do
  Game.create!(name: "Lorem ipsum dolor.",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non eleifend magna, sit amet fermentum mi. In mattis nec tellus in volutpat. Nunc ligula ante, tristique nec libero eu, dapibus viverra ex.",
              creator: user)
end
