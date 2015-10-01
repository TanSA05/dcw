class AddRespondentSummonedIfPersonToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :respondent_summoned_if_person, :boolean
  end
end
