class Revision < ApplicationRecord
  belongs_to :game
  belongs_to :collaborator, class_name: "User", optional: true

  validates_presence_of :name, :description, :game_id

  def text_description
    Nokogiri::HTML(self.description).text
  end

  def standard_created_at
    self.created_at.strftime("%Y.%m.%d")
  end

  def rev_username
    if self.collaborator == nil
      "anonymous"
    else
      self.collaborator.username
    end
  end
end
