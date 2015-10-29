class AddDaysForFinalResponseToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :days_for_final_response, :integer
  end
end
