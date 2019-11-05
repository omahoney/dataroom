class Optionplan < ApplicationRecord
  has_many :options

  belongs_to :company
  belongs_to :stockplan
  belongs_to :resolution

  has_one_attached :optionplan_document
end
