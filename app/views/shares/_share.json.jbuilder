json.extract! share, :id, :company_id, :person_id, :finances_id, :certificate, :shares_issued, :share_price, :cash, :issued_date, :active, :terminated_date, :domicile, :exemption, :reference, :status, :notes, :created_at, :updated_at
json.url share_url(share, format: :json)
