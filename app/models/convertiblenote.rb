class Convertiblenote < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :stockplan

  has_one_attached :convertiblenote_document
end
