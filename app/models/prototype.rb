class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
