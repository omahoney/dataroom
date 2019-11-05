class Share < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :stockplan

  has_one_attached :share_document

  scope :active, -> { where('active = ?', TRUE) }
  scope :terminated, -> { where('active = ?', FALSE) }
end
