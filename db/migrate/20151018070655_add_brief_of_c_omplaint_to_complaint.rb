class AddBriefOfCOmplaintToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :brief_of_complaint, :text
  end
end
