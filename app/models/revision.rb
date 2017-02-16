class Revision < ApplicationRecord
  belongs_to :game
  belongs_to :collaborator, class_name: "User"

  validates_presence_of :name, :description, :game_id
end
