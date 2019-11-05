class Compliance < ApplicationRecord
  belongs_to :company
  belongs_to :domicile

  has_one_attached :compliance_document
end
