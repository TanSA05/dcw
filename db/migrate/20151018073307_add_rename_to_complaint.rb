class AddRenameToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :contact_number_of_complainant, :string
    add_column :complaints, :locality, :string
  end
end
