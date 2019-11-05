class Resolution < ApplicationRecord
  belongs_to :company

  has_many :stockplans
  has_many :optionplans
  has_many :options

  has_one_attached :resolution_document
end
