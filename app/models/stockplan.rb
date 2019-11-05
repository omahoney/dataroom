class Stockplan < ApplicationRecord
  belongs_to :company
  belongs_to :resolution

  has_many :shares
  has_many :optionplans
  has_many :valuations
  has_many :finances

  has_one_attached :stockplan_document
end
