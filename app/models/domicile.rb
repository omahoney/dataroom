class Domicile < ApplicationRecord
  belongs_to :company
  has_many :compliances

  has_one_attached :domicile_document
end
