json.extract! person, :id, :company_id, :name, :first_name, :last_name, :title, :company_name, :address, :city, :state, :zip, :country, :email, :phone, :person_type, :created_at, :updated_at
json.url person_url(person, format: :json)
