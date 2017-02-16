class Game < ApplicationRecord
  has_many :revisions
  accepts_nested_attributes_for :revisions, allow_destroy: true, reject_if: lambda { |attributes| attributes['name'].blank? || attributes['description'].blank? }

  scope :recent, -> { order("created_at DESC").limit(5) }
  validates :name, :description, :creator_id, presence: true
  belongs_to :creator, class_name: :User

  def game_params
    params.require(:game).permit(:name, :description, revisions_attributes: [:id, :name, :description, :creator_id, :_destroy])
  end

  def text_description
    Nokogiri::HTML(self.description).text
  end

  def standard_created_at
    self.created_at.strftime("%Y.%m.%d")
  end
end
