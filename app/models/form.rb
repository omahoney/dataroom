class Form < ApplicationRecord
  belongs_to :company

  has_one_attached :form_document
end
