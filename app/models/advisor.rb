class Advisor < ApplicationRecord
  belongs_to :company
  belongs_to :person

  has_one_attached :advisor_document
end
