class Officer < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :resolution

  has_one_attached :officer_document
end
