json.extract! note, :id, :company_id, :person_id, :agreement_date, :note_date, :maturity_date, :interest_rate, :discount_rate, :share_cap, :qualified_finance, :conversion_date, :converted, :notes, :created_at, :updated_at
json.url note_url(note, format: :json)
