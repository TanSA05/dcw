class AddRespondentSummonedIfAgencyToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :respondent_summoned_if_agency, :boolean
  end
end
