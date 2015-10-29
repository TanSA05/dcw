class AddFieldsToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :next_target_date, :date
    add_reference :complaints, :organization, index: true, foreign_key: true
    rename_column :complaints, :target_date, :final_target_date
    remove_column :complaints, :registration_date
  end
end
