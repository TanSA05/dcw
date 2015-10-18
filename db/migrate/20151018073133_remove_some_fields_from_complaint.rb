class RemoveSomeFieldsFromComplaint < ActiveRecord::Migration
  def change
    remove_column :complaints, :contact_number, :string
    remove_column :complaints, :area, :string
    remove_column :complaints, :nature, :string
  end
end
