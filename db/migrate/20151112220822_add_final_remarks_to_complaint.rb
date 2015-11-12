class AddFinalRemarksToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :final_remarks, :text
  end
end
