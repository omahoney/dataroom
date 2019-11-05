class User < ApplicationRecord
  has_many :roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #enum role: [:user, :editor, :admin]
  #after_initialize :set_default_role, :if => :new_record?

 # def set_default_role
 #   self.role ||= :user
 # end
  def username
    return self.email.split('@')[0].capitalize
  end

  def role_on(company)
    roles.find_by(company_id: company).try(:name)
  end

  def can_edit?
    record.has_member?(editor) || record.has_member?(administrator)
  end

end
