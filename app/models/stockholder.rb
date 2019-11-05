class Stockholder < ApplicationRecord
  belongs_to :company
  belongs_to :person

  has_one_attached :stockholder_document
end
