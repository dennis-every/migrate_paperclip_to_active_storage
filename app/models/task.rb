class Task < ApplicationRecord
  has_one_attached :file, dependent: :destroy
end
