class Director < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :resolution

  has_one_attached :director_document
end
