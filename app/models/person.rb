class Person < ApplicationRecord
  belongs_to :company

  def self.full_name(id)
    @person = Person.find_by(id)
    full_name = @person.first_name + " " + @person.last_name
  end
end
