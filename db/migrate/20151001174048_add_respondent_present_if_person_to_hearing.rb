class AddRespondentPresentIfPersonToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :respondent_present_if_person, :boolean
  end
end
