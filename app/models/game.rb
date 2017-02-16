class Game < ApplicationRecord
  has_many :revisions

  scope :recent, -> { order("created_at DESC").limit(5) }
  validates :name, :description, :creator_id, presence: true

end
