json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :complainant, :respondent, :contact_number, :address, :area, :complaint_number, :target_date, :brief, :nature, :user_id, :file, :registration_date, :status, :prayers, :overdue
  json.url complaint_url(complaint, format: :json)
end
