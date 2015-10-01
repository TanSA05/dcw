class AddRespondentIfPersonToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :respondent_if_person, :string
  end
end
