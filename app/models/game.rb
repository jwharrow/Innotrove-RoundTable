class Game < ApplicationRecord
  validates :name, :description, :creator_id, presence: true

end
