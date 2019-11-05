class Dashboard < ApplicationRecord
  belongs_to :company


  scope :annual, lambda {|year| where("deadline >= ? and deadline <= ?", "#{year}-01-01", "#{year}-12-31")}
end
