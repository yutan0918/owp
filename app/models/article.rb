class Article < ApplicationRecord
  validates :title, presence: true
  validate :image_content_type, if: :was_attached?
  has_one_attached :thumbnail
  has_rich_text :content

  private
    def image_content_type
      extension = ['image/png', 'image/jpg', 'image/jpeg']
      errors.add(:thumbnail, "の拡張子が間違っています。png、jpg、jpegのみ利用可能です") unless thumbnail.content_type.in?(extension)
    end

    def was_attached?
      self.thumbnail.attached?
    end
end
