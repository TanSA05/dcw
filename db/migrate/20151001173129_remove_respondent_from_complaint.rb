class RemoveRespondentFromComplaint < ActiveRecord::Migration
  def change
    remove_column :complaints, :respondent, :string
  end
end
