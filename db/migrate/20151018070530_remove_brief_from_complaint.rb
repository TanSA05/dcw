class RemoveBriefFromComplaint < ActiveRecord::Migration
  def change
    remove_column :complaints, :brief, :text
  end
end
