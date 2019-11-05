class Valuation < ApplicationRecord
  belongs_to :company
  belongs_to :stockplan

  has_many :options

  has_one_attached :valuation_document
end
