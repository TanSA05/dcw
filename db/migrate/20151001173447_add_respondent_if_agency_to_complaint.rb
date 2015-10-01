class AddRespondentIfAgencyToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :respondent_if_agency, :string
  end
end
