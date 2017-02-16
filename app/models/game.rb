class Game < ApplicationRecord
  has_many :revisions

  scope :recent, -> { order("created_at DESC").limit(5) }
  validates :name, :description, :creator_id, presence: true
  belongs_to :creator, class_name: :User

  def text_description
    Nokogiri::HTML(self.description).text
  end

  def standard_created_at
    self.created_at.strftime("%Y.%m.%d")
  end

  def collaborator_count
    collabs = self.revisions.pluck(:collaborator_id)
    nils = collabs.length
    collabs.select! do |collab|
      collab != nil
    end
    nils -= collabs.length
    collabs.uniq.length + nils
  end
end
