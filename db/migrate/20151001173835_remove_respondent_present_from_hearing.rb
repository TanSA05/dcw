class RemoveRespondentPresentFromHearing < ActiveRecord::Migration
  def change
    remove_column :hearings, :respondent_present, :boolean
  end
end
