class Contract < ApplicationRecord
  belongs_to :company

  has_one_attached :contract_document
end
