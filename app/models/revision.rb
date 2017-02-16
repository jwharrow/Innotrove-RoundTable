class Revision < ApplicationRecord
  belongs_to :game
  belongs_to :collaborator, class_name: "User"

  validates_presence_of :name, :description, :game_id

  def text_description
    Nokogiri::HTML(self.description).text
  end

  def standard_created_at
    self.created_at.strftime("%Y.%m.%d")
  end
end
