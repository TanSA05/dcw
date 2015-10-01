class RemoveRespondentSummonedFromHearing < ActiveRecord::Migration
  def change
    remove_column :hearings, :respondent_summoned, :boolean
  end
end
