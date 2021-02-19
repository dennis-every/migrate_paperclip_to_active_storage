class Article < ApplicationRecord

  has_one_attached :document, dependent: :destroy

  # has_attached_file :document,
  #                   dependent: :destroy
  #
  # validates_attachment :document,
  #   content_type: { content_type: ["application/pdf","image/jpeg"] },
  #   size: { in: 0..6.megabytes }, if: Proc.new {|a| a.document.present? }



end
