class Nda < ApplicationRecord
  belongs_to :company

  has_one_attached :nda_document

  def expired
    if self.term == 'Perpetual' then
      expired = false
    else
      expirationDate = self.nda_date + self.term
      if expirationDate > today then
        expired = false
      else expired = true
      end
    end
  end
end
