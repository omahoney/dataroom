class Company < ApplicationRecord
  has_many :roles
  scope :active, -> { where('active = ?', true) }

  def has_member?(user)
    roles.exists?(user_id: user)
  end

  [:administrator, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end
  end

end
