class AddRespondentPresentIfAgencyToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :respondent_present_if_agency, :boolean
  end
end
