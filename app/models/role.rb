class Role < ApplicationRecord
  belongs_to :user
  belongs_to :company

  def self.available_roles
    %w(viewer editor administrator)
  end

end
