class Formation < ApplicationRecord
  belongs_to :company

  has_one_attached :formation_document
end
